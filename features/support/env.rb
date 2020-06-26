# frozen_string_literal: true

require 'capybara/cucumber'
require 'capybara'
require 'faker'
require 'pry'
require 'report_builder'
require 'selenium-webdriver'
require 'site_prism'

case ENV['BROWSER']
when 'firefox'
  @driver = :selenium
when 'chrome'
  @driver = :selenium_chrome
when 'headless'
  Capybara.register_driver :selenium_chrome_headless do |app|
    chrome_options = Selenium::WebDriver::Chrome::Options.new.tap do |options|
      options.add_argument '--headless'
      options.add_argument '--disable-gpu'
      options.add_argument '--no-sandbox'
      options.add_argument '--disable-site-isolation-trials'
      options.add_argument '--window-size=1440,900'
    end
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: chrome_options)
  end
  @driver = :selenium_chrome_headless
end

Capybara.configure do |config|
  config.default_driver = @driver
  config.app_host = 'https://ecommerce.picpay.com'
  config.ignore_hidden_elements = false
  config.default_max_wait_time = 15
  Capybara.page.driver.browser.manage.window.maximize
end
