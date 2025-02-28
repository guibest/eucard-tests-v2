*** Settings ***
Resource    ../../base.resource


*** Keywords ***
Swipe Tela Test
    Wait Until Element Is Visible    //android.widget.TextView[@text="Meus cartões"]
    Sleep    20     
    ${elemento_existe}=    Run Keyword And Return Status    Element Should Be Visible     ${multi_debito_0513}

    ${contador}=    Set Variable    0
    ${max_tentativas}=    Set Variable    10

    WHILE    not ${elemento_existe} and ${contador} < ${max_tentativas}  
        Swipe By Percent    50    30    50    60    400    
        ${elemento_existe}=    Run Keyword And Return Status    Element Should Be Visible     ${multi_debito_0513}
        Sleep    2
        ${contador}=    Evaluate    ${contador} + 1
    END

    Run Keyword If    not ${elemento_existe}    Fail    O elemento não foi encontrado após ${max_tentativas} tentativas
