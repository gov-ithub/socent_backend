ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

# PSQL FKs require superuser to disable constraints
# As I cannot grant this on my RDS DB, the order in 
# which fixtures are loaded/deleted must be strictly controlled
# http://stackoverflow.com/a/31309658/105929
class ActiveRecord::FixtureSet
  class << self
    alias :orig_create_fixtures :create_fixtures
  end
  def self.create_fixtures f_dir, fs_names, *args
    # Delete all fixtures that have foreign keys, in an order that
    # doesn't break referential integrity.

    TableOrderConcern::TABLE_ORDER.each do |t|
      t.delete_all
    end

    reset_cache

    fs_names = %w(organizations users groups) & fs_names | fs_names

    orig_create_fixtures f_dir, fs_names, *args
  end
end
