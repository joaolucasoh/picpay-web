# frozen_string_literal: true

require 'report_builder'

Before do |_scenario|
  visit('/')
  @picpay = PicPayPages.new
end

After do
  Capybara.execute_script 'localStorage.clear()'
end

After do |scenario|
  screenshot = page.save_screenshot("log/screenshots/#{scenario.__id__}.png")
  embed(screenshot, 'image/png', 'Screenshot')
end
