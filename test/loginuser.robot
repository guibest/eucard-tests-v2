
*** Settings ***
Resource    ../base.resource
Resource    ../resources/utils/login.resource
Test Setup    OpenEucard
*** Test Cases ***


Cenário: Pagamento de boleto
    Login User Gui

