# frozen_string_literal: true

module TypeOfRegister
  include Commons

  def pf_register
    check_page_title_step3_pf
    find_by('responsible_name').set(Faker::Name.name)
    find_by('responsible_cpf').set(Faker::CPF.numeric)
    find_by('responsible_birth_date').set('11091988')
    find_by('responsible_mother_name').set(Faker::Name.name)
    find_by('responsible_phone').set(Faker::Number.number(digits: 11))
    find_by('organization_phone').set(Faker::Number.number(digits: 11))
    click_on('Continuar')
  end

  def pj_register
    check_page_title_step3_pj
    find_by('organization_cnpj').set(Faker::CNPJ.numeric)
    find_by('organization_company_name').set(Faker::Company.name)
    find_by('organization_fantasy_name').set(Faker::Company.name)
    find_by('responsible_phone').set(Faker::Number.number(digits: 11))
    find_by('organization_phone').set(Faker::Number.number(digits: 11))
    click_on('Continuar')
    find_by('responsible_name').set(Faker::Name.name)
    find_by('responsible_cpf').set(Faker::CPF.numeric)
    find_by('responsible_birth_date').set('11091988')
    find_by('responsible_mother_name').set(Faker::Name.name)
    click_on('Continuar')
  end
end
World(TypeOfRegister)
