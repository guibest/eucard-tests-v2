*** Settings ***

Resource   ../../base.resource



*** Keywords ***
Transferencia
    [Documentation]    Executa uma transferência e valida o saldo atualizado
    Wait Until Element Is Visible    ${espera_tela_inicial}
    Selecionar Cartao Debito e Saldo
    Realizar Transferencia
    Digitar Senha PED
    Finalizar Transferencia
    Validar Saldo Atualizado

Selecionar Cartao Debito e Saldo
    Wait Until Element Is Visible    ${multi_credito_0513}
    Scroll     ${multi_debito_0513}    ${multi_credito_0513}
    Wait Until Element Is Visible    ${multi_debito_0513}
    ${texto_saldo_inicial}    Get Text    ${SELETOR_SALDO}
    Set Test Variable    ${texto_saldo_inicial}
    Click Element    ${multi_debito_0513}



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
