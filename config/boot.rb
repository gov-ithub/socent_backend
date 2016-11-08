ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.

# change default server port because the dev box conflicting envs
require 'rails/commands/server'

module Rails
  class Server
    alias :default_options_alias :default_options
    def default_options
      default_options_alias.merge!(Port: ENV['SOCENT_API_DEVELOPMENT_PORT'] || 3000)
    end    
  end
end
