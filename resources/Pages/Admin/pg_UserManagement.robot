*** Settings ***
Documentation    User Management Page     

Resource         ../../base.resource

*** Variables ***
&{pg_userManagement}
...    btn_add=button[class="oxd-button oxd-button--medium oxd-button--secondary"]
...    btn_search=button[type="submit"][class="oxd-button oxd-button--medium oxd-button--secondary orangehrm-left-space"]
...    btn_edit=i[class="oxd-icon bi-trash"]
...    btn_delete=i[class="oxd-icon bi-pencil-fill"]
