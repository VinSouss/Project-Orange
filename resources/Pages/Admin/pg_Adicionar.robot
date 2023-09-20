*** Settings ***
Documentation    Add users page as administrator    

Resource         ../../base.resource
Resource    ../../Keywords/kw_base.robot

*** Variables ***
&{pg_admin_add}
...    btn_icon_userRole=(//i[contains(@class,'oxd-icon bi-caret-down-fill oxd-select-text--arrow')])[1]
...    option_admin=//div[@class='oxd-select-text-input'][contains(.,'Admin')]
...    btn_icon_status=(//i[@class='oxd-icon bi-caret-down-fill oxd-select-text--arrow'])[2] 
...    option_enabled=//div[@class='oxd-select-text-input'][contains(.,'Enabled')]
...    input_employeN=input[placeholder="Type for hints..."]
...    input_userName=//*[@id="app"]/div[1]/div[2]/div[2]/div/div/form/div[1]/div/div[4]/div/div[2]/input
...    alert_message_userName=//span[contains(.,'Should be at least 5 characters')]
...    input_password=//input[@type='password'][1]
...    input_confirmPassword=//*[@id="app"]/div[1]/div[2]/div[2]/div/div/form/div[2]/div/div[2]/div/div[2]/input
...    btn_save=button[type=submit][class="oxd-button oxd-button--medium oxd-button--secondary orangehrm-left-space"]
...    toast_sucess=div[class="oxd-toast-container oxd-toast-container--bottom"] 
...    alert_userRole=//span[contains(.,'Required')]
...    alert_employeeN=//span[contains(.,'Invalid')]
...    alert_status=(//span[contains(.,'Required')])[2]
...    alert_password=//span[contains(.,'Should have at least 7 characters')]
   
   
*** Keywords ***
Given que o usuário esteja logado no sistema como admin
    Logged in user as administrador
When ele acessar a tela de admin no sistema  
    Click Element                        css=${pg_menus.menu_admin}
    Wait Until Element Is Visible        css=${pg_userManagement.btn_add}
And clicar no botão "+Add"    
    Click Element                        css=${pg_userManagement.btn_add}
    Wait Until Element Is Visible        css=${pg_admin_add.btn_save}
And preenche os campos obrigatórios

    ${employN}                           Set Variable                                   Linda Jane Anderson
    ${userName}                          Set Variable                                   Sr Orange Teste
    ${password}                          Set Variable                                   teste123
    Click Element                        xpath=${pg_admin_add.btn_icon_userRole}
    Press Special Key                    DOWN
    Press Special Key                    ENTER
    Element Should Be Visible            xpath=${pg_admin_add.option_admin}
    SeleniumLibrary.Input Text           css=${pg_admin_add.input_employeN}             ${employN}
    Wait Until Page Contains             text=${employN}                                
    Press Special Key                    DOWN 
    Press Special Key                    ENTER
    Click Element                        xpath=${pg_admin_add.btn_icon_status}
    Press Special Key                    DOWN
    Press Special Key                    ENTER
    Element Should Be Visible            xpath=${pg_admin_add.option_enabled}
    SeleniumLibrary.Input Text           xpath=${pg_admin_add.input_userName}           ${userName}
    Wait Until Element Is Not Visible    xpath=${pg_admin_add.alert_message_userName}           
    Input Password                       xpath=${pg_admin_add.input_password}           ${password}
    Input Password                       xpath=${pg_admin_add.input_confirmPassword}    ${password}


When clicar no botão save
    Click Element                        css=${pg_admin_add.btn_save}
Then o sistema realiza a adição de um usuário com sucesso
    Wait Until Element Is Visible        css=${pg_admin_add.toast_sucess}
    Wait Until Element Is Visible        css=${pg_userManagement.btn_search}        


And preencher os campos de forma inválida
    ${employN}                           Set Variable                                   teste
    ${userName}                          Set Variable                                   test
    ${password}                          Set Variable                                   teste
    
    SeleniumLibrary.Input Text           css=${pg_admin_add.input_employeN}             ${employN}
    SeleniumLibrary.Input Text           xpath=${pg_admin_add.input_userName}           ${userName} 
    Input Password                       xpath=${pg_admin_add.input_password}           ${password}
    Input Password                       xpath=${pg_admin_add.input_confirmPassword}    ${password}
    When clicar no botão save

Then o sistema informa ao administrador que os campos estão inválidos
    Wait Until Element Is Visible            xpath=${pg_admin_add.alert_userRole}    
    Wait Until Element Is Visible            xpath=${pg_admin_add.alert_employeeN}   
    Wait Until Element Is Visible            xpath=${pg_admin_add.alert_status}    
    Wait Until Element Is Visible            xpath=${pg_admin_add.alert_message_userName}    
    Wait Until Element Is Visible            xpath=${pg_admin_add.alert_password}    

