*** Settings ***
Resource    ../../base.resource

*** Keywords ***

Adicionar Cartão
    Wait Until Element Is Visible    //android.widget.TextView[@text="Meus cartões"]   
    Sleep    5

    # Verifica se o cartão 0513 já está presente antes de iniciar a adição.
    ${cartao_existe}=    Run Keyword And Return Status    Element Should Be Visible    //android.widget.TextView[@resource-id="homeBalance-0513-Débito"]

    Run Keyword If    ${cartao_existe}    Log To Console    🚨 O cartão 0513 já existe. Encerrando teste.
    Run Keyword If    ${cartao_existe}    Return From Keyword

    # Se o cartão NÃO existir, segue o fluxo para adicionar um novo
    Adicionar Cartão - Fluxo Completo
    Swipe Tela

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

Swipe Tela
    Sleep    5

    Wait Until Element Is Visible    //android.widget.TextView[@text="Meus cartões"]
    Sleep    15     
    Swipe By Percent    50    30    50    60    400    
  
   
  
   