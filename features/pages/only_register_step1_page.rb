# frozen_string_literal: true

require_relative 'base_page'

class StepOneFields
  attr_accessor :step_one_fields
  include Capybara::DSL
  include Commons

  def insert_data(field, data)
    @field = field
    within('#header') { click_on('Crie sua conta') }

    find_by(@field).set(data)
    find_by(@field).send_keys(:tab)
  end

  def validate_error_alert(msg_alert)
    if @field == 'email'
      find('#mat-error-0', text: msg_alert)
    elsif @field == 'email_confirmation'
      find('#mat-error-1', text: msg_alert)
    elsif @field == 'password'
      find('#mat-error-2', text: msg_alert)
    elsif @field == 'password_confirmation'
      find('#mat-error-3', text: msg_alert)
    end
  end
end
