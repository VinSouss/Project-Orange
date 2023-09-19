*** Settings ***
Documentation    Login Functionality

Resource         ../resources/base.resource
Test Setup    Abrir navegador
Test Teardown    Fechar navegador

*** Test Cases ***
Cenário 01: Login com sucesso
    [Tags]    login_sucess
    Given que o usuário deseja realizar login no site
    When ele preenche os campos de usuário e senha válidos    
    And clica no botão login
    Then o usuario realiza o login com sucesso
Cenário 02: Login Invalido
   [Tags]    login_inv
   Given que o usuário deseja realizar login no site
   When ele preenche os campos de username e password inválidos
   And clica no botão login
   Then o sistema exibe uma mensagem que as credenciais estão inválidas
Cenário 03: Username Inválido e Password Válido 
    [Tags]  userInv_passValid
    Given que o usuário deseja realizar login no site
    When ele preenche o campo de username válido e senha inválida
    And clica no botão login
    Then o sistema exibe uma mensagem que as credenciais estão inválidas

Cenário 04: Username Válido e Password Inválido
    [Tags]    userValid_passInv
    Given que o usuário deseja realizar login no site
    When ele preenche o campo de username inválido e senha válido
    And clica no botão login
    Then o sistema exibe uma mensagem que as credenciais estão inválidas
