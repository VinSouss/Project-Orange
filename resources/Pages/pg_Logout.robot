*** Settings ***
Documentation    System Logout Page
Resource    ../base.resource

*** Variables ***
&{pg_logout}
...                                  icon=i[class="oxd-icon bi-caret-down-fill oxd-userdropdown-icon"]
...                                  btn_logout=a[href="/web/index.php/auth/logout"]
    


*** Keywords ***
Given que o usuário esteja logado no sistema
    Logged in user as administrador
And deseja fazer logout do sistema
    Wait Until Element Is Visible    css=${pg_menus.menu_dashboard}  
When clicar no ícone com sua foto no canto superior direito
    Click Element                    css=${pg_logout.icon}     
And clicar na opção de logout
    Wait Until Element Is Visible    css=${pg_logout.btn_logout}
    Click Element                    css=${pg_logout.btn_logout}
Then o usuário irá fazer logout com sucesso
    Wait Until Element Is Visible    css=${pg_login.btn_login}