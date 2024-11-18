require 'capybara/cucumber'
require 'selenium-webdriver'
require 'capybara/dsl'
require 'rspec'


Dir["#{Dir.pwd}/features/util/**/*.rb"].each { |file| require file }
include Capybara::DSL
include RSpec::Matchers
RSpec.configure { |config| config.include Capybara::DSL, type: :feature }


Capybara.configure do |config|
  config.default_selector = :css
  config.default_max_wait_time = 40
  config.default_driver = :selenium_chrome
end
