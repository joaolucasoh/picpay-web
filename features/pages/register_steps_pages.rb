# frozen_string_literal: true

require_relative 'base_page'

module Register
  class RegistrationSteps
    attr_accessor :registration_steps
    include Commons
    include Capybara::DSL

    def insert_correct_data_step1
      email = find_by('email').set(Faker::Internet.email)
      find_by('email_confirmationa').set(email)
      password = find_by('password').set(Faker::Internet.password(min_length: 8))
      find_by('password_confirmation').set(password)
    end

    def select_register_type(type)
      choose(type, allow_label_click: true)
    end

    def insert_correct_data_step3
      find_by('responsible_name').set(Faker::Name.name)
      find_by('responsible_cpf').set(Faker::CPF.numeric)
      find_by('responsible_birth_date').set(Faker::Date.birthday(min_age: 18, max_age: 99))
      find_by('responsible_mother_name').set(Faker::Name.name)
      find_by('responsible_phone').set(Faker::Number.number(digits: 11))
      find_by('organization_phone').set(Faker::Number.number(digits: 11))
    end

    def insert_correct_data_step4
      find_by('address_zipcode').set(CepBrasil::Random.generate_formatted)
      find_by('address_number').set(Faker::Number.number(3))
    end

    def choose_your_plan(option)
      choose(option, allow_label_click: true)
    end

    def choose_your_organization_category(option)
      find_by('organization_mcc_category_id').find(:option, option).select_option
    end

    def insert_correct_data_step5
      find_by('organization_name').set(Faker::Company.name)
      find_by('ecommerce_store_url').set(Faker::Internet.url)
    end

    def upload_avatar
      find('button').set('../../img/avatar.png')
      find('.check').click
      click_on('Continuar')
    end

    def review_page
      click_on('Finalizar')
      has_text?('Aguarde um momento, seu cadastro está sendo finalizdo.')
    end
  end
end
World(Register)
