*** Settings ***
Documentation    System Login Page

Resource         ../base.resource

*** Variables ***
&{pg_login}
...                  input_username=input[name="username"] 
...                  input_password=input[name="password"][type="password"]
...                  btn_login=button[type="submit"]
...                  alert_error=//div[@class='oxd-alert oxd-alert--error']
${user_admin}        admin
${password_admin}    admin123


*** Keywords ***
Given que o usuário deseja realizar login no site
    Wait Until Element Is Visible    css=${pg_login.btn_login}    5
When ele preenche os campos de usuário e senha válidos
    SeleniumLibrary.Input Text       css=${pg_login.input_username}    ${user_admin}
    Input Password                   css=${pg_login.input_password}    ${password_admin}
And clica no botão login
    Click Element                    css=${pg_login.btn_login}
Then o usuario realiza o login com sucesso
    Wait Until Element Is Visible    css=${pg_menus.menu_dashboard}
    
When ele preenche os campos de username e password inválidos
    SeleniumLibrary.Input Text       css=${pg_login.input_username}    teste inválido
    Input Password                   css=${pg_login.input_password}    teste123
Then o sistema exibe uma mensagem que as credenciais estão inválidas
    Wait Until Element Is Visible    xpath=${pg_login.alert_error}
    
When ele preenche o campo de username válido e senha inválida
    SeleniumLibrary.Input Text       css=${pg_login.input_username}    admin
    Input Password                   css=${pg_login.input_password}    teste123
When ele preenche o campo de username inválido e senha válido
    SeleniumLibrary.Input Text       css=${pg_login.input_username}    teste inválido
    Input Password                   css=${pg_login.input_password}    admin123