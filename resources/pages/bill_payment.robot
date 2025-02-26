*** Settings ***
Resource    ../../base.resource

*** Keywords ***

Pagamento Boleto

    Wait Until Element Is Visible    ${espera_tela_inicial}
    Selecionar Pagamento Boleto
   
    Digitar Senha PED
   
    Finalizar Pagamento

Selecionar Pagamento Boleto    
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

    # Confirmar qual cartão está sendo usado
    Wait Until Element Is Visible    //android.widget.TextView[@text="•••• 0513 | Débito"]
    Click Element    //android.widget.TextView[@text="•••• 0513 | Débito"]
    
    # Scroll até o botão de continuar
    Wait Until Element Is Visible    ${scroll_conta}
    Scroll    ${scroll_valor}    ${scroll_conta}

    Wait Until Element Is Visible    ${btn_continuar}
    Click Element    ${btn_continuar}

Finalizar Pagamento
     # Após o loop, realiza um scroll para localizar elementos específicos (${btn_apagar} e ${text_multiconvenio}).
    # para deixar o botão finalizar transferência visível.

    Wait Until Element Is Visible    ${btn_finalizar_pagamento}    
    Click Element    ${btn_finalizar_pagamento}


Digitar Senha PED
    # Aguarda até que os botões de senha apareçam na tela
    Wait Until Page Contains Element    ${ELEMENT_XPATH}    40    

    # Loop para verificar cada par na lista de pares (@{PASSWORD_PAIRS}).
    FOR    ${pair}    IN    @{PASSWORD_PAIRS}
        # Registra no log qual par está sendo verificado.
        log    Verificando o PAR ${pair}
    
        # Tenta clicar no elemento correspondente ao par atual.
        Clique No Elemento Dinâmico    ${pair}
    END

Clique No Elemento Dinâmico
    [Arguments]    ${expected_text}
    @{elements}=    Get Webelements    ${ELEMENT_XPATH}
    ${found}=    Set Variable    False

    FOR    ${element}    IN    @{elements}
        ${text}=    Get Text    ${element}

        Run Keyword If    '${expected_text}' in '${text}'    Click Element    ${element}
        Run Keyword If    '${expected_text}' in '${text}'    Set Variable    ${found}    True

    END
    Run Keyword If    '${found}' == False    Fail    "Nenhum elemento correspondente encontrado para ${expected_text}"
    Log To Console    Loop acabou para ${expected_text}

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