*** Settings ***
Resource    ../../base.resource   

*** Keywords ***
Bloqueio Cartão
    Wait Until Element Is Visible    //android.widget.TextView[@text="Meus cartões"]
    
    ${elemento_existe}=    Run Keyword And Return Status    Element Should Be Visible    ${multi_debito_0513}  

    WHILE    not ${elemento_existe}  
        # Swipe lateral SOMENTE dentro do carrossel correto (começa em x100, y630)
        Swipe    900    630    200    630    # Ajuste as coordenadas conforme necessário  
        ${elemento_existe}=    Run Keyword And Return Status    Element Should Be Visible    ${multi_debito_0513}
    END  
    Click Element    ${multi_debito_0513}
    Wait Until Element Is Visible    ${btn_bloquear_cartao}
    #Para validar se o cartão ja esta bloqueado, checa se o texto desbloquear cartão esta visivel
    ${cartao_bloqueado}=    Run Keyword And Return Status    Element Should Be Visible    ${txt_desbloquear_cartao}
    Log To Console    Valor de cartao_bloqueado: ${cartao_bloqueado}
    IF    ${cartao_bloqueado}
        Log To Console    Cartão já está Bloqueado. Fluxo encerrado.
    RETURN
    END
    
    Click Element    ${btn_bloquear_cartao}
    Wait Until Element Is Visible    ${btn_confirmar_bloqueio}
    Click Element    ${btn_confirmar_bloqueio}