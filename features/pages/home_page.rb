# frozen_string_literal: true

require_relative '../pages/base_page.rb'

class HomePage
  attr_reader :home_page
  include Capybara::DSL

  def home_page?
    has_text?('Receba com PicPay em seu site')
    has_text?('Experimente grátis')
    has_text?('Crie sua conta')
  end
end
