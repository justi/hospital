require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :cuprite, screen_size: [1400, 1400], options:
      { js_errors: false }
end


Capybara.register_driver :cuprite do |app|
  Capybara::Cuprite::Driver.new(app, browser: :chrome)
end