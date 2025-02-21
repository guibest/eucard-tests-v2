*** Settings ***
Resource    ../../base.resource


*** Keywords ***
Login User anna
    [Setup]    OpenEucard
    [Documentation]    Realiza login utilizando as credenciais configuradas.
    Wait Until Element Is Visible    //android.widget.EditText[@text="Digite seu CPF"]    15 
    Input Text   //android.widget.EditText[@text="Digite seu CPF"]   ${username_anna}   
    Input Text   //android.widget.EditText[@text="Digite sua senha"]   ${password_padrao}
    Click Element   ${botao_Entrar}

    Wait Until Element Is Visible    ${btn_preciso}
    Click Element    ${btn_preciso}
    Wait Until Element Is Visible    ${btns_Allow}
    Click Element    ${btns_Allow}
    Wait Until Element Is Visible    ${noticacaoes}
    Click Element    ${noticacaoes}

Login User joao
    [Setup]    OpenEucard
    [Documentation]    Realiza login utilizando as credenciais configuradas.
    Wait Until Element Is Visible    //android.widget.EditText[@text="Digite seu CPF"]    15 
    Input Text   //android.widget.EditText[@text="Digite seu CPF"]   ${username_joao}   
    Input Text   //android.widget.EditText[@text="Digite sua senha"]   ${password_padrao}
    Click Element   ${botao_Entrar}

    Wait Until Element Is Visible    ${btn_preciso}   15
    Click Element    ${btn_preciso}
    Wait Until Element Is Visible    ${btns_Allow}
    Click Element    ${btns_Allow}
    Wait Until Element Is Visible    ${noticacaoes}
    Click Element    ${noticacaoes}

Login User Teste
    [Setup]    OpenEucard
    [Documentation]    Realiza login utilizando as credenciais configuradas.
    Wait Until Element Is Visible    //android.widget.EditText[@text="Digite seu CPF"]    15 
    Input Text   //android.widget.EditText[@text="Digite seu CPF"]   ${username_conta_teste}   
    Input Text   //android.widget.EditText[@text="Digite sua senha"]   ${password_conta_teste}
    Click Element   ${botao_Entrar}

    #Wait Until Element Is Visible    ${btn_preciso}
    #Click Element    ${btn_preciso}
    #Wait Until Element Is Visible    ${btns_Allow}
    #Click Element    ${btns_Allow} 
    Wait Until Element Is Visible    ${noticacaoes}
    Click Element    ${noticacaoes}

Login User Gui
    [Setup]    OpenEucard
    [Documentation]    Realiza login utilizando as credenciais configuradas.
    Wait Until Element Is Visible    //android.widget.EditText[@text="Digite seu CPF"]    15 
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

Login User Teste 287
    [Setup]    OpenEucard
    [Documentation]    Realiza login utilizando as credenciais configuradas.
    Wait Until Element Is Visible    //android.widget.EditText[@text="Digite seu CPF"]    15 
    Input Text   //android.widget.EditText[@text="Digite seu CPF"]   287.768.810-08   
    Input Text   //android.widget.EditText[@text="Digite sua senha"]   ${password_padrao}
    Click Element   ${botao_Entrar}

 #   Wait Until Element Is Visible    ${btn_preciso}   15
 #   Click Element    ${btn_preciso}
 #   Wait Until Element Is Visible    ${btns_Allow}
 #   Click Element    ${btns_Allow}
    Wait Until Element Is Visible    ${noticacaoes}
    Click Element    ${noticacaoes}

Login User Sergio
    [Setup]    OpenEucard
    [Documentation]    Realiza login utilizando as credenciais configuradas.
    Wait Until Element Is Visible    //android.widget.EditText[@text="Digite seu CPF"]    15 
        Input Text   //android.widget.EditText[@text="Digite seu CPF"]   ${username_sergio}   
    Input Text   //android.widget.EditText[@text="Digite sua senha"]   ${senha_sergio}
    Click Element   ${botao_Entrar}

 #   Wait Until Element Is Visible    ${btn_preciso}   15
 #   Click Element    ${btn_preciso}
 #   Wait Until Element Is Visible    ${btns_Allow}
 #   Click Element    ${btns_Allow}
    Wait Until Element Is Visible    ${noticacaoes}
    Click Element    ${noticacaoes}