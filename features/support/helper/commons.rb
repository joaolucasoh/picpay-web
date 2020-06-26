# frozen_string_literal: true

module Commons
  def find_by(field)
    find("[formcontrolname='#{field}']")
  end

  def step1?
    find('h3', 'Escolha suas informações de acesso')
  end

  def step2?
    find('h3', 'Você gostaria de se cadastrar como?')
  end

  def step3?
    find('h3', 'Sobre você')
  end

  def step4?
    find('h3', 'Seu endereço')
  end

  def step6?
    find('h3', 'Escolha uma imagem para o avatar')
  end

  def step7?
    find('h3', 'Tudo certo?')
  end
end
