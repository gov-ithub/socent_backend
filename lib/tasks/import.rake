require 'csv'
require 'json'

namespace :import do

  module ProviderCsvTags
    NAME_FURNIZOR = 0
    STREET = 1
    NO = 2
    CITY = 3
    COUNTY = 4
    COD = 5
    SOCIAL_SERVICE = 6
    TYPE= 7
    CATEGORY = 8
    CAPACITY = 9
    EMAIL = 10
    PHONE = 11
    LATITUDE = 12
    LONGITUDE = 13
  end

  module TagsSS
    ID   = 0
    COD  = 1
    DESC = 2
    SERV = 3
  end

  desc 'Extrage nomenclator centre sociale'
  task :nomenclator_centre_sociale do 
    puts JSON.generate(extract_nomenclator_centre_sociale)
  end

  def extract_nomenclator_centre_sociale
    filename = '../nomenclator-centre-sociale.csv'
    ss = []
    cat = ''
    CSV.foreach(filename, headers: true, col_sep: ',', encoding:'utf-8') do |row|
      id = fix(row[TagsSS::ID])
      if (Integer(id) rescue false)
        ss << {
          id: id,
          cod: fix(row[TagsSS::COD]).gsub(/\s/,'').gsub(/[-–—]/, '-'),
          desc: fix(row[TagsSS::DESC]).gsub(/\A[\sIV\.]+/,''),
          servicii: fix(row[TagsSS::SERV]).split(/,\s*(?=[A-ZÎ])/).map {|x| fix(x)},
          
          cat: cat
        }
      else
        cat = id
      end
    end
    ss
  end

  def find_ss(ss, codSS)
    index = ss.index {|x| 0 == (x[:cod].gsub(/-/,'').casecmp(codSS.gsub(/-/,'')))}
    return ss[index][:cod], true  if index
    return codSS, false
  end

  def fix(v)
    (v || '').squish
  end

  desc 'Geotag CSV'
  task :geotag_csv do
    ss = extract_nomenclator_centre_sociale
    # Geocoder.configure(lookup: :nominatim)
    Geocoder.configure(lookup: :google, api_key: 'AIzaSyAJVeuCmPnjSS0QGlnSUDVQaBQqbfXEduY', use_https: true)
    i = 0
    CSV.filter($stdin, $stdout, 
        out_force_quotes: true,
        headers: true,
        return_headers: false,
        write_headers: true,
        skip_blanks: true) do |row|
      i += 1
      cdr = {
        lat:    fix(row[ProviderCsvTags::LATITUDE]),
        lng:    fix(row[ProviderCsvTags::LONGITUDE])
      }
      begin
        geo = Geocoder.search"#{fix(row[ProviderCsvTags::STREET])}}, #{fix(row[ProviderCsvTags::CITY])}, #{fix(row[ProviderCsvTags::COUNTY])}, Romania"
        cdr = {
          lat: geo.first.latitude,
          lng: geo.first.longitude
        } unless geo.nil? or geo.first.nil?
      rescue Exception => ex
        STDERR.puts "geo: #{ex.class.name} #{ex.message}"
      end
      cod = fix_codSS(i, ss, fix(row[ProviderCsvTags::COD]))
      [ProviderCsvTags::NAME_FURNIZOR,
            ProviderCsvTags::STREET,
            ProviderCsvTags::NO,
            ProviderCsvTags::CITY,
            ProviderCsvTags::COUNTY,
            ProviderCsvTags::SOCIAL_SERVICE,
            ProviderCsvTags::TYPE,
            ProviderCsvTags::CAPACITY,
            ProviderCsvTags::EMAIL
            ].each do |idx|
        row[idx] = fix(row[idx])
      end
      row[ProviderCsvTags::PHONE] =fix(row[ProviderCsvTags::PHONE]).gsub(/[\.\-\s]*/,'')
      row[ProviderCsvTags::CATEGORY] = fix(row[ProviderCsvTags::CATEGORY]).split(',').map(&:upcase).map(&:squish).join(',')
      row[ProviderCsvTags::COD] = cod
      row[ProviderCsvTags::LATITUDE] = cdr[:lat]
      row[ProviderCsvTags::LONGITUDE] = cdr[:lng]

      # 5/s rate
      sleep 0.2
    end
  end

  def fix_codSS(i, ss, codSS)
      codSS = codSS.gsub(/[\s\.]/,'').gsub(/[-–—]/, '-')
      cod = ''
      begin
        cod, found = find_ss(ss, codSS)
        if !found
          STDERR.puts "##{i+1}: #{codSS}"
        end
      rescue Exception => e
        STDERR.puts "fix_codSS: ##{i+1} #{e.class.name} #{e.message}: #{codSS}"
      end unless codSS.nil? or codSS.empty?
      cod
  end

  def fix_phones(phones)
    fix(phones).gsub(/[-–—()\s+]/,'').split(/(?<=[\d\/]{8})[,\/]/).map do |x| fix(x).gsub(/\//,'').gsub(/\A0*(40)?/,'') end
  end
  
  desc 'Converteste csv organizatiile sociale in JSON'
  task :csv_social_json do
    ss = extract_nomenclator_centre_sociale
    providers = []
    i = 1
    CSV.new($stdin, col_sep: ',', encoding:'utf-8').each do |row|
      
      providers << {
        id:         i,
        name:       fix(row[ProviderCsvTags::SOCIAL_SERVICE]),
        furnizor:   fix(row[ProviderCsvTags::NAME_FURNIZOR]),
        adresa:     "#{fix(row[ProviderCsvTags::STREET])} #{fix(row[ProviderCsvTags::NO])}",
        oras:       fix(row[ProviderCsvTags::CITY]),
        jud:        fix(row[ProviderCsvTags::COUNTY]),
        cod:        fix_codSS(i, ss, fix(row[ProviderCsvTags::COD])), # fix(row[ProviderCsvTags::COD]),
        type:       fix(row[ProviderCsvTags::TYPE]),
        categorie:  fix(row[ProviderCsvTags::CATEGORY]).split(',').map!(&:upcase).map!(&:squish),
        capacitate: fix(row[ProviderCsvTags::CAPACITY]),
        email:      fix(row[ProviderCsvTags::EMAIL]),
        phone:      fix_phones(row[ProviderCsvTags::PHONE]),
        lat:        fix(row[ProviderCsvTags::LATITUDE]),
        lng:        fix(row[ProviderCsvTags::LONGITUDE])
        }
      i += 1
    end
    STDOUT.puts JSON.generate({ss: ss, providers: providers})
  end

end
