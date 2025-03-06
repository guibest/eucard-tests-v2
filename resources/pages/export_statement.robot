*** Settings ***

Resource    ../../base.resource

*** Keywords ***

Exportar Extrato  

    [Documentation]    Exportar Extrato
    Wait Until Element Is Visible    ${multi_debito_0513}    15
    Click Element    ${multi_debito_0513}
    Wait Until Element Is Visible    ${btn_extrato}    15
    Click Element    ${btn_extrato}
    
    