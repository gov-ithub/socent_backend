# http://derekdevries.com/2009/04/13/rails-seed-data/
require 'active_record/fixtures'

namespace :db do

  desc "Seed the database with once/ and always/ fixtures."
  task :seed => :environment do
    load_fixtures "seed/once"
    load_fixtures "seed/always", :always
  end

  desc "Seed the database with develop/ fixtures."
  task :develop => :environment do
    load_fixtures 'seed/develop', :always
  end

  private

  def load_fixtures(dir, always = false)
    populate = []
    TableOrderConcern::TABLE_ORDER.each do |t|
      table_name = t.table_name
      file_path = Rails.root.join('db', dir, table_name + '.yml')
      next if !File.exists? file_path

      if table_empty?(table_name) || always
        puts "Truncating #{table_name}"
        truncate_table(table_name)
        populate << table_name
      end
    end

    populate.reverse_each do |t|
      puts "Populating #{t}"
      ActiveRecord::FixtureSet.create_fixtures(File.join('db/', dir), t)
    end
  end

  def table_empty?(table_name)
    quoted = connection.quote_table_name(table_name)
    connection.select_value("SELECT COUNT(*) FROM #{quoted}").to_i.zero?
  end

  def truncate_table(table_name)
    quoted = connection.quote_table_name(table_name)
    connection.execute("TRUNCATE TABLE #{quoted} CASCADE")
  end

  def connection
    ActiveRecord::Base.connection
  end

end
