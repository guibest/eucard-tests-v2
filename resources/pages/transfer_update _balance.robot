*** Settings ***

Resource    ../../base.resource



Test Setup    Login User Gui

# Fluxo completo 

*** Variables ***
@{PASSWORD_PAIRS}     4 ou 9    9 ou 4    3 ou 2  2 ou 3  5 ou 8  8 ou 5  5 ou 8    8 ou 5
${ELEMENT_XPATH}      //android.widget.TextView[contains(@text, 'ou')]
${SELETOR_SALDO}    //android.widget.TextView[@resource-id="homeBalance-0513-Débito"]

*** Keywords ***

Transferencia       

    # Scroll e select cartão de débito na home
    Wait Until Element Is Visible    ${multi_credito_0513}
    Scroll     ${multi_debito_0513}    ${multi_credito_0513}
    
    #Get do saldo inicial
    Wait Until Element Is Visible    ${multi_debito_0513}
    ${texto_saldo_inicial}    Get Text    ${SELETOR_SALDO}
    
    #Clica no cartão de débito selecionado
    Click Element    ${multi_debito_0513}
    
    # Passos para transferencia, Fluxo pelo botão serviços 
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
    Click Element        ${btn_continuar}
    
    
     # Aguarda até que um elemento com o caminho definido (${ELEMENT_XPATH}) esteja visível na página.
    Wait Until Page Contains Element    ${ELEMENT_XPATH}    40    

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

    Wait Until Element Is Visible    ${btn_finalizar_transferencia}    
    Click Element    ${btn_finalizar_transferencia}
      
    #Comprova que foi realizada a transferência e clica no botão de fechar
    Wait Until Element Is Visible    ${comprovante_transferencia}
    Element Should Be Visible    ${comprovante_transferencia}
    Click Element    ${btn_fechar_comprovante}
    
    # Volta para home para iniciar a revisão de Saldo
    Wait Until Element Is Visible   ${btn_home}

    Click Element    ${btn_home}

    # Valor da Transferecia junto somados manualmente com a taxa para obter o saldo final
    #(Analise de função automática para obter o valor final da transferencia)
    Verificar Atualizacao De Saldo    ${texto_saldo_inicial}    1,00   

Clique No Elemento Dinâmico
    # Define um argumento chamado ${expected_text}, que será o texto esperado a ser encontrado nos elementos.
    [Arguments]    ${expected_text}

    # Obtém todos os elementos da página que correspondem ao caminho XPath definido (${ELEMENT_XPATH}). 
    # Elementos que compoem a Senha PED
    @{elements}=    Get Webelements    ${ELEMENT_XPATH}

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

Verificar Atualizacao De Saldo
    [Arguments]    ${saldo_inicial}    ${valor_transferencia}
    ${timeout}=    Set Variable    60  # Tempo máximo de espera (em segundos)
    ${intervalo}=    Set Variable    10  # Intervalo entre verificações (em segundos)
    ${saldo_atualizado}=    Set Variable    False

    # Converte saldo inicial e valor da transferência para números
    ${saldo_inicial_num}    Replace String    ${saldo_inicial}    ,    .
    ${saldo_inicial_num}    Convert To Number    ${saldo_inicial_num}
    ${valor_transferencia_num}    Replace String    ${valor_transferencia}    ,    .
    ${valor_transferencia_num}    Convert To Number    ${valor_transferencia_num}
    ${saldo_esperado}    Evaluate    ${saldo_inicial_num} - ${valor_transferencia_num}

    Log    Saldo Inicial: ${saldo_inicial_num}, Valor Transferência: ${valor_transferencia_num}, Saldo Esperado: ${saldo_esperado}

    # Loop para verificar se o saldo foi atualizado
    FOR    ${tempo}    IN RANGE    0    ${timeout}    ${intervalo}
        Wait Until Element Is Visible    ${SELETOR_SALDO}
        ${texto_saldo_atual}    Get Text    ${SELETOR_SALDO}

        # Converte o saldo capturado para número
        ${saldo_atual_limpo}    Replace String    ${texto_saldo_atual}    ,    .
        ${saldo_atual_limpo}    Convert To Number    ${saldo_atual_limpo}

        Log    Tentativa ${tempo}: Saldo Atual: ${saldo_atual_limpo}, Saldo Esperado: ${saldo_esperado}

        # Verifica se o saldo foi atualizado
        Run Keyword If    ${saldo_atual_limpo} == ${saldo_esperado}
        ...    Exit For Loop    # Sai do loop se o saldo for o esperado

                # Caso o saldo não tenha atualizado, força um reload da página Swipe By Percent
        Log    Saldo ainda não atualizado. Navegando para tela Extrato para forçar reload.
        Swipe By Percent    50    30    50    60    400    
  
        Sleep    ${intervalo}    # Aguarda atualização antes de nova tentativa
    END

    # Validação final após o loop
    Should Be Equal As Numbers    ${saldo_atual_limpo}    ${saldo_esperado}    Saldo não foi atualizado no tempo esperado.

    