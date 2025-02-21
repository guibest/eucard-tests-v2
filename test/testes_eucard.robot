
*** Settings ***
Resource    ../base.resource
Resource    ../resources/utils/login.resource

*** Test Cases ***

Cenário: Abrir appActivito
    OpenEucard
    Login User Gui