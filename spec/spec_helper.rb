require 'rubygems'

# All our specs should require 'spec_helper' (this file)

# If RACK_ENV isn't set, set it to 'test'.  Sinatra defaults to development,
# so we have to override that unless we want to set RACK_ENV=test from the
# command line when we run rake spec.  That's tedious, so do it here.
ENV['RACK_ENV'] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)
require 'shoulda-matchers'
require 'rack/test'
require 'capybara'
require 'capybara/rspec'
require 'database_cleaner'
require 'factory_girl'
require 'faker'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

path_to_factories = File.expand_path('../factories', __FILE__)
Dir["#{path_to_factories}/*.rb"].each { |file| require file }

RSpec.configure do |config|
  config.include Rack::Test::Methods

  config.include FactoryGirl::Syntax::Methods

  # DatabaseCleaner setup
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each) { DatabaseCleaner.start }
  config.after(:each)  { DatabaseCleaner.clean }
end

def app
  Sinatra::Application
end

Capybara.app = app.new
