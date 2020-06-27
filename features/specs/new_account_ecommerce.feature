# language: en

Feature: Routine for registering new customers on the picpay ecommerce platform.
    Being a customer interested in selling my products on the PicPay platform
    I must be able to make a new registration or access, if you already have access

    Background: Validate that you are really on the home page
        Given I am on the home page

    @step1validate
    Scenario Outline: Validation of data inconsistencies in step-1
        And I fill in the '<fields>' with the '<data>'
        Then the '<alert messages>' should be displayed
        Examples:
            | fields                | data   | alert messages                           |
            | email                 | 1234   | Este campo deve conter um e-mail válido! |
            | email_confirmation    | picpay | Este campo deve conter um e-mail válido! |
            | password              | 1234   | O tamanho minimo deve ser 6 caracteres!  |
            | password_confirmation | 4321   | Os campos de senhas deve corresponder!   |
    
    @completeregister
    Scenario Outline: Create a complete pf or pj register
        When I fill in the your access data
        And select the '<type>' of your account
        And after you fill in the data about you
        Then insert your address
        And select the '<plan>' and fill in company infos and your '<category>'
        And upload a avatar to account
        Then you must confirm the data and complete the registration
        Examples:
            | type            | plan    | category                |
            | Pessoa física   | 14 dias | Arte e Antiguidades     |
            | Pessoa jurídica | 30 dias | Automóveis e Acessórios |

