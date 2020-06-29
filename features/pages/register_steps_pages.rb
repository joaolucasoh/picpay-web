# frozen_string_literal: true

require_relative 'base_page'

class RegisterSteps
  attr_accessor :register_steps
  include Commons
  include TypeOfRegister

  def insert_access_info
    within('#header') { click_on('Crie sua conta') }

    email_saved = Faker::Internet.email
    password_saved = Faker::Internet.password(min_length: 8)

    find_by('email').set(email_saved)
    find_by('email_confirmation').set(email_saved)
    find_by('password').set(password_saved)
    find_by('password_confirmation').set(password_saved)

    click_on('Continuar')
  end

  def select_register_type(type)
    @type = type
    choose(@type, allow_label_click: true)
    click_on('Continuar')
  end

  def insert_info_about_you
    if @type == 'Pessoa física'
      pf_register
    elsif @type == 'Pessoa jurídica'
      pj_register
    end
  end

  def insert_address
    find_by('address_zipcode').set('08532410')
    find_by('address_zipcode').send_keys(:tab)
    sleep 1
    find_by('address_number').set(Faker::Number.number(digits: 3))
    click_on('Continuar')
  end

  def choose_your_plan(option)
    choose(option, allow_label_click: true)
  end

  def insert_company_info(category)
    find_by('organization_name').set(Faker::Company.name)
    find_by('ecommerce_store_url').set(Faker::Internet.url)
    choose_your_organization_category(category)
    click_on('Continuar')
  end

  def choose_your_organization_category(category)
    find_by('organization_mcc_category_id').click
    find('.mat-option-text', text: category).click
  end

  def upload_avatar
    cover_file = File.join(Dir.pwd, 'features/support/img/avatar.png')
    attach_file(cover_file)
    sleep 1
    find('.check').click if find('.check', visible: true)
    click_on('Continuar')
  end

  def review_page
    click_on('Finalizar')
    has_text?('Aguarde um momento, seu cadastro está sendo finalizado.')
  end

  def refresh_page
    page.driver.browser.navigate.refresh
  end

  def am_i_on_login_page?
    find_by('cnpj') && find_by('email') && find_by('password')
    has_css?("[href='/esqueci-a-senha']") && has_button?('Entrar')
  end
end
