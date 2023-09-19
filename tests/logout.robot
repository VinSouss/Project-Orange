*** Settings ***
Documentation    Logout Functionality

Resource         ../resources/base.resource
Test Setup    Abrir navegador
Test Teardown    Fechar navegador

*** Test Cases ***
Cenário 02 - Logout com sucesso
    [Tags]    Logout_sucesso
    Given que o usuário esteja logado no sistema
    And deseja fazer logout do sistema
    When clicar no ícone com sua foto no canto superior direito
    And clicar na opção de logout
    Then o usuário irá fazer logout com sucesso