ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require "capybara/cuprite"


class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  Capybara.javascript_driver = :cuprite

  # Add more helper methods to be used by all tests here...
  Capybara::Cuprite::Network::Response.include DataAccessor
end
