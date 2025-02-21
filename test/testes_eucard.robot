
*** Settings ***
Resource    ../base.resource
Resource    ../resources/utils/login.resource
Test Setup    OpenEucard
*** Test Cases ***

Cenário: Abrir appActivito    
    Login User Gui
    Adicionar Cartão - Fluxo Completo 
