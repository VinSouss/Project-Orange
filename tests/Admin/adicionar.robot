*** Settings ***
Documentation    Functionality of adding users as administrator

Resource         ../../resources/base.resource
Test Setup       Abrir navegador
Test Teardown    Fechar navegador

*** Test Cases ***
Cenário 01 - Adição de um usuário com sucesso
    [Tags]    add_sucesss
    Given que o usuário esteja logado no sistema como admin
    When ele acessar a tela de admin no sistema    
    And clicar no botão "+Add"    
    And preenche os campos obrigatórios
    When clicar no botão save
    Then o sistema realiza a adição de um usuário com sucesso