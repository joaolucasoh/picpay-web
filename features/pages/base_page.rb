# frozen_string_literal: true

require_relative 'home_page'

class PicPayPages
  attr_accessor :home_page, :register_steps

  def initialize
    @home_page = HomePage.new
    @register_steps = RegisterSteps.new
  end
end
