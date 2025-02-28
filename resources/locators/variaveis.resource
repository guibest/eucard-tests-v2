*** Variables ***
#botões com o mesmo indentificator xpath
${btn_continuar}    //android.widget.TextView[@text="Continuar"]


# Variaveis globais para senha PED

@{PASSWORD_PAIRS}     4 ou 9    9 ou 4    3 ou 2  2 ou 3  5 ou 8  8 ou 5  5 ou 8    8 ou 5
#@{PASSWORD_PAIRS}     7 ou 5    5 ou 7    4 ou 6  6 ou 4  0 ou 1  1 ou 0  6 ou 4    4 ou 6
${ELEMENT_PASSWORD}      //android.widget.TextView[contains(@text, 'ou')]
${ELEMENT_XPATH}      //android.widget.TextView[contains(@text, 'ou')]

# Variaveis para update de saldo
${SELETOR_SALDO}    //android.widget.TextView[@resource-id="homeBalance-0513-Débito"]

# #Variaveis de login 
${username_anna}      10283336927
${username_joao}      46652448807

${username_conta_teste}    20912653060
${password_padrao}      Eucard@2024

${password_conta_teste}      Teste@pontos1

${username_gui}    04016816963
${username_sergio}    84032065934
${senha_sergio}    03E@E&*0&B3e

${usernameErrado}    20912653061
${passowrdErrado}     Teste@pontos2
${botao_Entrar}    //android.widget.Button[@content-desc="Entrar"]

#Espera tela incial
${espera_tela_inicial}    //android.widget.TextView[@text="Meus cartões"]


#Variaveis de tempo
${tempoEsperaMaxima}    120        # Tempo máximo de espera em segundos, considerando os atrasos de resposta da API
${check_intervalo}   10           # intervalo de verificação de tempo em segundos


#Variaveis dos botões de acesso rapido na parte inferior do app
${btn_home}    //android.widget.TextView[@text="início"]
${btn_extrato}    //android.widget.TextView[@text="extrato"]
${btn_servicos}    //android.widget.TextView[@text="serviços"]
${btn_perfil}    //android.widget.TextView[@text="perfil"]

#Variaveis Carrousel Para o dia dia
${btn_boleto}    //android.view.ViewGroup[@content-desc="Boleto"]
${btn_finalizar_pagamento}    //android.widget.TextView[@text="Finalizar pagamento"]

# Pamento de boleto
${btn_digitar_boleto}    //android.widget.Button[@content-desc="Digitar código de barras"]
${input_codigo_barras}    //android.widget.EditText[@text="Digite o código de barras"]
${alert_boleto}    //android.view.ViewGroup[@content-desc="BOLETO DE PAGAMENTO JA BAIXADO"]
${erro_codigo_barras}    //android.widget.TextView[@text="Erro na conversao de Linha Digitavel para Codigo de Barras"]
${scroll_conta}    //android.widget.TextView[@text="Pagar conta"]
${scroll_valor}    //android.widget.TextView[@text="Valor"]

#Variaveis da transferência Fluxo: home/ transferencia
${btn_transferencia}    //android.widget.TextView[@text="Transferência"]
${conta_destino}     //android.widget.TextView[@text="Eucard"]
${select_debit_card}    //android.widget.TextView[@text="•••• 0513 | Débito"]
${btn_finalizar_transferencia}    //android.widget.TextView[@text="Finalizar transferência"]
${comprovante_transferencia}    //android.widget.TextView[@text="Comprovante de transferência"]

#Variaveis de transferência Fluxo: Selecionar cartão carrosel/ Selecionar Serviços / Transferencia.
${multi_credito_0513}    //android.widget.TextView[@resource-id="homeBalance-0513-Crédito"]
${multi_debito_0513}    //android.widget.TextView[@resource-id="homeBalance-0513-Débito"]
${btn_servicos_transferencia}    //android.view.ViewGroup[@content-desc="Transferência"]/android.view.ViewGroup
${btn_fechar_comprovante}    //com.horcrux.svg.SvgView


# Variaveis para o Scroll na tela da senha PED de transferência, para que o botão confirmar transferencia fique visivel
${btn_apagar}    //android.widget.TextView[@text="Apagar"]
${text_multiconvenio}   //android.widget.TextView[@text="MULTICONVENIO"]


#Variaveis do Android ao abrir o aplicativo
${salvar_login_senha}    //android.widget.Button[@resource-id="android:id/autofill_save_yes"]
${noticacaoes}    //android.widget.Button[@resource-id="com.android.permissioncontroller:id/permission_allow_button"]
                
${btns_Allow}    //android.widget.Button[@resource-id="com.android.permissioncontroller:id/permission_allow_foreground_only_button"]
${btn_preciso}    //android.widget.Button[@resource-id="com.android.permissioncontroller:id/permission_deny_button"]


#Variaveis para Adicionar novo cartão Pior Fluxo

${drop_down_cards}    //android.view.ViewGroup[@content-desc="Multiconvenio, •••• 0513"]/com.horcrux.svg.SvgView[2]
${btn_novo_cartao}   //android.widget.TextView[@text="Adicionar novo cartão"]
${numero_cartao}    //android.widget.EditText[@text="Ex: 0000 0000 0000 0000"]
${titular_card}    //android.widget.EditText[@text="Ex: Fulano O Silva"]
${validade_card}    //android.widget.EditText[@text="Ex: 01/30"]
${CVV}    //android.widget.EditText[@text="Ex: 123"]

#adicionar cartão Conta vazia
${btn_add_card_carrosel}    //android.widget.TextView[@text="Adicionar novo cartão"]


# Variaveis para deletar cartões
${btn_excluir_cartao}    //android.widget.HorizontalScrollView/android.view.ViewGroup/android.widget.Button[4]
${valida_card_numero}    //android.widget.TextView[@text="•••• •••• •••• 0513"]
${btn_sim_excluir}    //android.widget.TextView[@text="Sim, excluir"]
${btn_cancelar_delete_card}     //android.widget.Button[@content-desc="Cancelar"]

# Variaveis para Bloqueio e Desbloqueio de cartão
${btn_bloquear_cartao}    //android.widget.HorizontalScrollView/android.view.ViewGroup/android.widget.Button[3]
${txt_desbloquear_cartao}=    //android.widget.TextView[contains(@text, "desbloquear") and contains(@text, "cartão")]
${btn_desbloquear_cartao}    //android.widget.HorizontalScrollView/android.view.ViewGroup/android.widget.Button[3]
${btn_confirmar_bloqueio}    //android.widget.TextView[@text="Bloquear"]
${btn_cancelar_bloqueio}    //android.widget.TextView[@text="Cancelar"]
${btn_confirmar_desbloqueio}    //android.widget.TextView[@text="Desbloquear"]
${alart_suces_desbloqueio}    //android.widget.TextView[@text="Cartão desbloqueado com sucesso"]

# Variaveis para seleção de cartão

#Cartão de testes 0513
${multi_credito_0513}    //android.widget.TextView[@resource-id="homeBalance-0513-Crédito"]
${multi_debito_0513}    //android.widget.TextView[@resource-id="homeBalance-0513-Débito"]
#Cartão 0211 do Bruno para testes de adicionar e remover cartão
${multi_credito_0211}    //android.widget.TextView[@resource-id="homeBalance-0211-Crédito"]
${multi_debito_0211}    //android.widget.TextView[@resource-id="homeBalance-0211-Débito"]
#Cartão 8611 do João Testes de troca de senha
${multi_credito_8611}    //android.widget.TextView[@resource-id="homeBalance-8611-Crédito"]
${multi_debito_8611}    //android.widget.TextView[@resource-id="homeBalance-8611-Débito"]
${alimentacao_joao_9911}    //android.widget.TextView[@resource-id="homeBalance-9911-Débito"]

# Variaveis para troca de senha de cartão nominal
${btn_alterar_senha}    //android.widget.HorizontalScrollView/android.view.ViewGroup/android.widget.Button[2]
${senha_atual_cartao}    //android.widget.EditText[@text="Senha atual"]    
${senha_nova_cartao}    //android.widget.EditText[@text="Nova senha"]
${confirmar_senha_cartao}    //android.widget.EditText[@text="Confirmação de senha"]
${btn_confirmar_alterar_senha}    //android.widget.TextView[@text="Alterar senha"]


# Modais de Abertura do app
${btn_nao_ativa_biometria}    //android.widget.TextView[@text="Não quero ativar biometria"]

# Swaipe no carroeusel de cartões 
${swaipe_cartoes_direita}    //android.widget.HorizontalScrollView/android.view.ViewGroup/android.widget.Button[1]

# Elementos para teste de asserticos
${assert_sucesso_add_card}    //android.widget.TextView[@text="Sucesso"]
${assert_sucesso_de_card}    //android.widget.TextView[@text="Cartão adicionado com sucesso"]
${assert_sucesso_bloqueio}    //android.widget.TextView[@text="Cartão bloqueado com sucesso"]
${assert_sucesso_desbloqueio}    //android.widget.TextView[@text="Cartão desbloqueado com sucesso"]