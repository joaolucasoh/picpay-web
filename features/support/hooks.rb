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
  temp_shot = page.save_screenshot("log/screenshots/#{scenario}image.png")
  screenshot = Base64.encode64(File.open(temp_shot).read)
  attach(screenshot, 'image/png')
end

at_exit do
  @infos = {
    'Cliente' => 'PicPay'.upcase,
    'Data do Teste' => Time.now.to_s
  }

  ReportBuilder.configure do |config|
    config.input_path = 'log/report.json'
    config.report_path = 'log/report'
    config.report_types = [:json, :html]
    config.report_title = 'PicPay QA Engineer Challenge!'
    config.include_images = true
    config.additional_info = @infos
    config.color = 'green'
  end
  ReportBuilder.build_report
end

After do |scenario|
  if scenario.failed?
    screenshot 'image.png'
    attach('image.png', 'image/png')
  end
end
