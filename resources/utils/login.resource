*** Settings ***

Resource    ../../base.resource



*** Keywords ***


Login User Gui
    [Setup]    OpenEucard
    [Documentation]    Realiza login utilizando as credenciais configuradas.
    Wait Until Element Is Visible    ${login.texto_tela_login}
    Input Text   //android.widget.EditText[@text="Digite seu CPF"]   ${username_gui}   
    Input Text   //android.widget.EditText[@text="Digite sua senha"]   ${password_padrao}
    Click Element   ${botao_Entrar}

 #   Wait Until Element Is Visible    ${btn_preciso}   15
 #   Click Element    ${btn_preciso}
 #   Wait Until Element Is Visible    ${btns_Allow}
 #   Click Element    ${btns_Allow}
    Wait Until Element Is Visible    ${noticacaoes}
    Click Element    ${noticacaoes}
    Click Element    //android.widget.Button[@content-desc="Não quero ativar biometria"]
