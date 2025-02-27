*** Settings ***

Resource    ../../base.resource

*** Keywords ***

Desbloqueio Cartão
    
    Wait Until Element Is Visible    ${multi_debito_0513}    15
    Click Element    ${multi_debito_0513}
    Wait Until Element Is Visible    ${btn_desbloquear_cartao}
    Click Element    ${btn_desbloquear_cartao}
    Wait Until Element Is Visible    ${btn_confirmar_desbloqueio}
    Click Element    ${btn_confirmar_desbloqueio}
    Wait Until Element Is Visible    ${btn_home}    20
    Click Element    ${btn_home}