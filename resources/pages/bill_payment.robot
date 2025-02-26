*** Settings ***

Resource    ../../base.resource




*** Keywords ***

Pagamento Boleto

    #passos até o pagamento de boleto
    Wait Until Element Is Visible    ${btn_boleto}
    Click Element    ${btn_boleto}
    Wait Until Element Is Visible    ${btns_Allow}
    Click Element    ${btns_Allow}
    Wait Until Element Is Visible    ${btn_digitar_boleto}
    Click Element    ${btn_digitar_boleto}
    Wait Until Element Is Visible    ${input_codigo_barras}
    Input Text    ${input_codigo_barras}    75691.33379 01072.306101 00000.710012 7 99750000000100
    Wait Until Element Is Visible    ${btn_continuar}
    Click Element    ${btn_continuar}
    
    # Verificar mensagens de erro
    Verificar Mensagens De Erro

    # Seleciona o cartão de teste para pagamento por débito

    Wait Until Element Is Visible    //android.widget.TextView[@resource-id="homeBalance-3011-0Debito"]
    Click Element    //android.widget.TextView[@resource-id="homeBalance-3011-Debito"]
    
    # Scroll até o botão de continuar
    Wait Until Element Is Visible    ${scroll_conta}
    Scroll    ${scroll_valor}    ${scroll_conta}

    Wait Until Element Is Visible    ${btn_continuar}
    Click Element    ${btn_continuar}



     # Aguarda até que um elemento com o caminho definido (${ELEMENT_XPATH}) esteja visível na página.
    Wait Until Page Contains Element    ${ELEMENT_PASSWORD}

    # Loop para verificar cada par na lista de pares (@{PASSWORD_PAIRS}).
    FOR    ${pair}    IN    @{PASSWORD_PAIRS}
        # Registra no log qual par está sendo verificado.
        log    Verificando o PAR ${pair}
    
        # Tenta clicar no elemento correspondente ao par atual.
        Clique No Elemento Dinâmico    ${pair}
    END

    # Após o loop, realiza um scroll para localizar elementos específicos (${btn_apagar} e ${text_multiconvenio}).
    # para deixar o botão finalizar transferência visível.
    Scroll    ${btn_apagar}    ${text_multiconvenio}

    Wait Until Element Is Visible    ${btn_finalizar_pagamento}    
    Click Element    ${btn_finalizar_pagamento}
 

Verificar Mensagens De Erro
    [Documentation]    Verifica se mensagens de erro específicas aparecem na tela e encerra o teste em caso positivo.
    # Verifica o elemento "Boleto já baixado"
    ${status_boleto}=    Run Keyword And Ignore Error    Wait Until Element Is Visible    ${alert_boleto}    timeout=10
    ${boleto_status}=    Set Variable    ${status_boleto}[0]
    Run Keyword If    '${boleto_status}' == 'PASS'
    ...    Fail    "Erro: Boleto já foi baixado."

    # Verifica o elemento "Código de barras inválido"
    ${status_codigo_barras}=    Run Keyword And Ignore Error    Wait Until Element Is Visible    ${erro_codigo_barras}    timeout=5
    ${codigo_status}=    Set Variable    ${status_codigo_barras}[0]
    Run Keyword If    '${codigo_status}' == 'PASS'
    ...    Fail    "Erro: Código de barras inválido."



Clique No Elemento Dinâmico

    # Define um argumento chamado ${expected_text}, que será o texto esperado a ser encontrado nos elementos.
    [Arguments]    ${expected_text}

    # Obtém todos os elementos da página que correspondem ao caminho XPath definido (${ELEMENT_XPATH}).
    @{elements}=    Get Webelements    ${ELEMENT_PASSWORD}

    # Inicializa uma variável chamada ${found} como False, para rastrear se algum elemento foi clicado.
    ${found}=    Set Variable    False

    # Loop por todos os elementos encontrados.
    FOR    ${element}    IN    @{elements}
        # Obtém o texto do elemento atual.
        ${text}=    Get Text    ${element}
        
        # Verifica se o texto do elemento contém o texto esperado 
        Run Keyword If    '${expected_text}' in '${text}'
        ...    Click Element    ${element}  # Clica no elemento se a condição for verdadeira.

    END