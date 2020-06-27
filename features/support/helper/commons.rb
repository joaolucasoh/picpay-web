# frozen_string_literal: true

module Commons
  def find_by(field)
    find("[formcontrolname='#{field}']")
  end

  def check_page_title_step1
    find('h3', text: 'Escolha suas informações de acesso')
  end

  def check_page_title_step2
    find('h3', text: 'Você gostaria de se cadastrar como?')
  end

  def check_page_title_step3_pf
    find('h3', text: 'Sobre você')
  end

  def check_page_title_step3_pj
    find('h3', text: 'Sobre sua empresa')
  end

  def check_page_title_step4
    find('h3', text: 'Seu endereço')
  end

  def check_page_title_step6
    find('h3', text: 'Escolha uma imagem para o avatar')
  end

  def check_page_title_step7
    find('h3', text: 'Tudo certo?')
  end
end
World(Commons)
