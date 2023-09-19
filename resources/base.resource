*** Settings ***
Documentation    All project Libraries and Resources

Library          SeleniumLibrary
Library          SikuliLibrary

Resource         ../resources/Pages/pg_Login.robot
Resource         ../resources/Pages/menus.robot
Resource         ../resources/Pages/pg_Logout.robot
Resource         ../resources/Pages/Admin/pg_UserManagement.robot
Resource         ../resources/Pages/Admin/pg_Adicionar.robot

Resource         ../resources/Keywords/kw_base.robot