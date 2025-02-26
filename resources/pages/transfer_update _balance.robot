*** Settings ***

Resource   ../../base.resource



*** Variables ***
@{PASSWORD_PAIRS}     4 ou 9    9 ou 4    3 ou 2  2 ou 3  5 ou 8  8 ou 5  5 ou 8    8 ou 5
${ELEMENT_XPATH}      //android.widget.TextView[contains(@text, 'ou')]
${SELETOR_SALDO}      //android.widget.TextView[@resource-id="homeBalance-0513-Débito"]

*** Keywords ***
Transferencia
    [Documentation]    Executa uma transferência e valida o saldo atualizado
    Wait Until Element Is Visible    //android.widget.TextView[@text="Meus cartões"]
    Selecionar Cartao Debito
    Obter Saldo Inicial
    Realizar Transferencia
    Digitar Senha PAD
    Finalizar Transferencia
    Validar Saldo Atualizado

Selecionar Cartao Debito
    Wait Until Element Is Visible    ${multi_credito_0513}
    Scroll     ${multi_debito_0513}    ${multi_credito_0513}
    Wait Until Element Is Visible    ${multi_debito_0513}
    Click Element    ${multi_debito_0513}

Obter Saldo Inicial
    ${texto_saldo_inicial}    Get Text    ${SELETOR_SALDO}
    Set Test Variable    ${texto_saldo_inicial}

Realizar Transferencia
    Wait Until Element Is Visible    ${btn_servicos}
    Click Element    ${btn_servicos}
    Wait Until Element Is Visible    ${btn_servicos_transferencia}
    Click Element    ${btn_servicos_transferencia} 
    Wait Until Element Is Visible    ${conta_destino}
    Click Element    ${conta_destino}
    Wait Until Element Is Visible    ${btn_continuar}
    Click Element    ${btn_continuar}     
    Wait Until Element Is Visible    ${select_debit_card}
    Click Element    ${select_debit_card}
    Wait Until Element Is Visible    //android.widget.EditText[@text="R$ 0,00"]
    Input Text    //android.widget.EditText[@text="R$ 0,00"]    1,00
    Wait Until Element Is Visible    ${btn_continuar}
    Click Element    ${btn_continuar}

Digitar Senha PAD
    # Aguarda até que os botões de senha apareçam na tela
    Wait Until Page Contains Element    ${ELEMENT_XPATH}    timeout=40    

    # Loop para clicar em cada número/par na senha PAD
    FOR    ${pair}    IN    @{PASSWORD_PAIRS}
        Log    "Digitando parte da senha: ${pair}"

        # Aguarda até que o elemento esteja disponível antes de clicar
        Wait Until Keyword Succeeds    3x    1s    Clique No Elemento Dinâmico    ${pair}

        # Pequeno delay para evitar que o clique não seja registrado corretamente
        Sleep    0.5  
    END



Clique No Elemento Dinâmico
    [Arguments]    ${expected_text}
    @{elements}=    Get Webelements    ${ELEMENT_XPATH}
    ${found}=    Set Variable    False
    FOR    ${element}    IN    @{elements}
        ${text}=    Get Text    ${element}
        IF    '${expected_text}' in '${text}'
            Click Element    ${element}
            ${found}=    Set Variable    True
            BREAK
        END
    END
    Run Keyword If    '${found}' == 'False'    Fail    "Elemento com texto '${expected_text}' não encontrado!"


Finalizar Transferencia
    Wait Until Element Is Visible    ${btn_finalizar_transferencia}    
    Click Element    ${btn_finalizar_transferencia}
    Wait Until Element Is Visible    ${comprovante_transferencia}
    Element Should Be Visible    ${comprovante_transferencia}
    Click Element    ${btn_fechar_comprovante}
    Wait Until Element Is Visible   ${btn_home}
    Click Element    ${btn_home}

Validar Saldo Atualizado
    Verificar Atualizacao De Saldo    ${texto_saldo_inicial}    1,00   

Verificar Atualizacao De Saldo
    [Arguments]    ${saldo_inicial}    ${valor_transferencia}
    ${timeout}=    Set Variable    60
    ${intervalo}=    Set Variable    10
    ${saldo_atualizado}=    Set Variable    False
    ${saldo_inicial_num}    Replace String    ${saldo_inicial}    ,    .
    ${saldo_inicial_num}    Convert To Number    ${saldo_inicial_num}
    ${valor_transferencia_num}    Replace String    ${valor_transferencia}    ,    .
    ${valor_transferencia_num}    Convert To Number    ${valor_transferencia_num}
    ${saldo_esperado}    Evaluate    ${saldo_inicial_num} - ${valor_transferencia_num}
    Log    Saldo Inicial: ${saldo_inicial_num}, Valor Transferência: ${valor_transferencia_num}, Saldo Esperado: ${saldo_esperado}

    FOR    ${tempo}    IN RANGE    0    ${timeout}    ${intervalo}
        Wait Until Element Is Visible    ${SELETOR_SALDO}
        ${texto_saldo_atual}    Get Text    ${SELETOR_SALDO}
        ${saldo_atual_limpo}    Replace String    ${texto_saldo_atual}    ,    .
        ${saldo_atual_limpo}    Convert To Number    ${saldo_atual_limpo}
        Log    Tentativa ${tempo}: Saldo Atual: ${saldo_atual_limpo}, Saldo Esperado: ${saldo_esperado}

        Run Keyword If    ${saldo_atual_limpo} == ${saldo_esperado}    Exit For Loop
        Log    Saldo ainda não atualizado. Navegando para tela Extrato para forçar reload.
        Swipe By Percent    50    30    50    60    400    
        Sleep    ${intervalo}
    END
    Should Be Equal As Numbers    ${saldo_atual_limpo}    ${saldo_esperado}    Saldo não foi atualizado no tempo esperado.
