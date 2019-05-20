require "capybara/cuprite"
require 'json'
require 'httparty'


Capybara.register_driver :cuprite do |app|
  Capybara::Cuprite::Driver.new(app, browser: :chrome)
end
Capybara.always_include_port = false

def cont(r)
  r =~ /cmsEventsInRange/i
end

namespace :network_traffic do
  desc "This task parses the network traffic from given resource url"
  task :parse, [:url] => :environment do |_, arg|
    session = Capybara::Session.new(:cuprite)
    urls = []
    session.visit arg.url
    session.driver.network_traffic.each do |request|
      next unless cont(request.response.url)
      urls << request.response.url
    end
    session.driver.clear_network_traffic

    urls.each do |url|
      response = HTTParty.get(url)
      puts JSON.parse(response.body)
    end
  end
end