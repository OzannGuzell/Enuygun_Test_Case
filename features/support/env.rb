require 'capybara/cucumber'
require 'selenium-webdriver'
require 'capybara/dsl'
require 'rspec'
require 'allure-cucumber'
require 'report_builder'


Dir["#{Dir.pwd}/features/util/**/*.rb"].each { |file| require file }
include Capybara::DSL
include RSpec::Matchers
RSpec.configure { |config| config.include Capybara::DSL, type: :feature }


Capybara.configure do |config|
  config.default_selector = :css
  config.default_max_wait_time = 40
  config.default_driver = :selenium_chrome
end

AllureCucumber.configure do |config|
  config.results_directory = 'reports/allure-results' # Test sonuçlarının kaydedileceği dizin
  config.clean_results_directory = true # Her çalıştırmadan önce eski sonuçları temizler
  config.logging_level = Logger::INFO # Log seviyesini ayarlar
end
