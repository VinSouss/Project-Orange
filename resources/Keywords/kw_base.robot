*** Settings ***
Documentation    System Globals Keywords

Resource         ../base.resource

*** Variables ***
${URL}                 https://opensource-demo.orangehrmlive.com/web/index.php/auth/login

*** Keywords ***
Abrir navegador 
    Open Browser       ${URL}    chrome
    Set Window Size    1920    1080

Fechar navegador 
    Capture Page Screenshot    
    Close Browser

Logged in user as administrador
    Given que o usuário deseja realizar login no site
    When ele preenche os campos de usuário e senha válidos
    And clica no botão login
    Then o usuario realiza o login com sucesso