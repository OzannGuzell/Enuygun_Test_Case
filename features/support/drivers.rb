require 'capybara'
require 'selenium-webdriver'
require 'capybara/dsl'

Capybara.register_driver :selenium_chrome do |app|
  options = ::Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--disable-site-isolation-trials')
  options.add_argument('--start-maximized')

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end
