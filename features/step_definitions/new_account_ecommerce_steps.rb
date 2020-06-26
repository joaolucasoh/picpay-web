# frozen_string_literal: true

When('I am on the home page') do
  @picpay.home_page.home_page?
end

When('I fill in the {string} with the {string}') do |field, data|
  @picpay.register_step_one.insert_data(field, data)
end

Then('the {string} should be displayed') do |msg_alert|
  @picpay.register_step_one.validate_error_alert(msg_alert)
end

When('I fill in the {string} with the data') do |string|

end
