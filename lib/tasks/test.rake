namespace :test do

  desc 'Copy db/seed/always fixtures over test/fixtures'
  task :copy_always_fixtures_over_test => :environment do
    Dir.glob(Rails.root.join('db', 'seed', 'always', '*.yml')).each do |fixture_file|
      file_name = File.basename(fixture_file)
      target = Rails.root.join('test', 'fixtures', file_name)
      FileUtils.copy_file fixture_file, target
      Rails.logger.debug "cp #{fixture_file} => #{target}"
    end
  end

  Rake::Task['test'].enhance ['test:copy_always_fixtures_over_test']

end

