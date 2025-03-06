*** Settings ***
Resource    ../../base.resource

*** Keywords ***
Excluir Cartao
    Sleep    5
    Swipe By Percent    50    30    50    60    400    
    Wait Until Element Is Visible    ${multi_credito_0513}    15
    Click Element    ${multi_debito_0513}
    Wait Until Element Is Visible    ${btn_excluir_cartao}    20
    Click Element    ${btn_excluir_cartao}
    Wait Until Element Is Visible    ${btn_sim_excluir}  
    Click Element    ${btn_sim_excluir}
    ${cartao}=    Get Text    ${valida_card_numero}
    Run Keyword If    '${cartao}' == '•••• •••• •••• 0513'    Clicar Botao Excluir    ELSE    Clicar Botao Cancelar
    Log To Console    Cartão excluído com sucesso!

Clicar Botao Excluir
    Wait Until Element Is Visible    ${btn_sim_excluir}  
    Click Element    ${btn_sim_excluir}
    Wait Until Element Is Visible    //android.widget.TextView[@text="Cartão excluído com sucesso"]
    ${mensagem}=    Get Text    //android.widget.TextView[@text="Cartão excluído com sucesso"]
    Log To Console    ${mensagem}
    Should Be Equal    ${mensagem}    Cartão excluído com sucesso
    Wait Until Element Is Visible    ${btn_home}
    Click Element    ${btn_home}

Clicar Botao Cancelar
    Wait Until Element Is Visible    ${btn_cancelar_delete_card}
    Click Element    ${btn_cancelar_delete_card}


