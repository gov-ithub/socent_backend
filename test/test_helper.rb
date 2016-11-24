ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  
  def with_organization(organization, &block)
    OrganizationScope.with_organization_id organization.id do
      yield
    end
  end
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

    table_names = []
    TableOrderConcern::TABLE_ORDER.each do |t|
      t.delete_all
      table_names << t.table_name
    end

    reset_cache
    
    fs_names = table_names.reverse & fs_names | fs_names

    orig_create_fixtures f_dir, fs_names, *args
  end
end

# This module provides an easy to use authorization handler for controller tests
# ```
#  class SomeControllerTest < ActionDispatch::IntegrationTest
#     include TestLoginConcern
#     authorize :someuser
# ```
# will append a valid JWT token for users' test fixture `:someuser` to every request
# see to https://github.com/rails/rails/blob/master/actionpack/lib/action_dispatch/testing/integration.rb
module TestLoginConcern
  extend ActiveSupport::Concern

  included do |base|

    %w(get post patch put head delete).each do |method|
      alias_method "original_#{method}", method

      define_method(method) do |path, **args|
        args[:headers] = (args[:headers] || {}).merge self.auth_header
        send("original_#{method}", path, **args)
      end
    end
  end

  module ClassMethods

    def authorize(user)
      define_method(:setup) do
        @token = LoginConcern.create_token(users(user))
      end

      define_method(:auth_header) do
        {authorization: "Token #{@token.token}"}
      end
    end
  end
end

