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

#########
When('I fill in the your access data') do
  @picpay.register_steps.insert_access_info
end

When('select the {string} of your account') do |type|
  @picpay.register_steps.select_register_type(type)
end

When('after you fill in the data about you') do
  @picpay.register_steps.insert_info_about_you
end

Then('insert your address') do
  @picpay.register_steps.insert_address
end

Then('select the {string} and fill in company infos and your {string}') do |plan, category|
  @picpay.register_steps.choose_your_plan(plan)
  @picpay.register_steps.insert_company_info(category)
end

Then('upload a avatar to account') do
  @picpay.register_steps.upload_avatar
end

Then('you must confirm the data and complete the registration') do
  @picpay.register_steps.review_page
  @picpay.register_steps.refresh_page
end
