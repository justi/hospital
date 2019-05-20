require "capybara/poltergeist"
require 'json'
require 'httparty'

Capybara.register_driver :poltergeist do |app|
  options = {
      js_errors: false,
      debug: false,
      phantomjs_options: ['--load-images=no', '--disk-cache=false'],
      phantomjs_logger: File.open(File::NULL, 'w') #turn off the logs come from console
  }
  Capybara::Poltergeist::Driver.new(app, options)
end
Capybara.always_include_port = false

def cont(r)
  r =~ /cmsEventsInRange/i
end

namespace :network_traffic do
  desc "This task parses the network traffic from given resource url"
  task :parse, [:url] => :environment do |_, arg|
    session = Capybara::Session.new(:poltergeist)
    urls = []
    session.visit arg.url
    session.driver.network_traffic.each do |request|
      next unless cont(request.url)
      urls << request.url
    end
    session.driver.clear_network_traffic

    urls.each do |url|
      response = HTTParty.get(url)
      puts JSON.parse(response.body)
    end
  end
end