*** Settings ***
Resource    ../../base.resource

*** Keywords ***
Adicionar Cartão - Fluxo Completo  
    [Documentation]    Adicionar novo cartão, garantindo que o scroll ocorra no carrossel correto.

    ${elemento_existe}=    Run Keyword And Return Status    Element Should Be Visible    ${btn_add_card_carrosel}  

    WHILE    not ${elemento_existe}  
        # Swipe lateral SOMENTE dentro do carrossel correto (começa em x100, y630)
        Swipe    900    630    200    630    # Ajuste as coordenadas conforme necessário  
        ${elemento_existe}=    Run Keyword And Return Status    Element Should Be Visible    ${btn_add_card_carrosel}  
    END  

    Click Element    ${btn_add_card_carrosel}  
    Wait Until Element Is Visible    //android.widget.TextView[@text="Novo cartão"]  

    # 🔥 Validações pós-input para garantir sucesso do preenchimento
    Wait Until Element Is Visible    ${numero_cartao}
    Input Text    ${numero_cartao}    6088199025200513  
   
    Input Text    ${titular_card}    cartão de testes  
    Input Text    ${validade_card}    07/27  
    Input Text    ${CVV}    241  
    Click Element    ${btn_continuar}  

    # 🔥 Verificar se a tela final de sucesso apareceu
    Wait Until Element Is Visible    //android.widget.TextView[@text="Cartão adicionado com sucesso!"]   10

    ${mensagem}=    Get Text    //android.widget.TextView[@text="Cartão adicionado com sucesso!"]
    Log To Console    ${mensagem}
    Should Be Equal    ${mensagem}    Cartão adicionado com sucesso!

    Log To Console    ✅ Cartão adicionado com sucesso!