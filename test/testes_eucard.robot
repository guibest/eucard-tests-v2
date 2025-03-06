
*** Settings ***
Resource    ../base.resource
Resource    ../resources/utils/login.resource
Test Setup    OpenEucard
*** Test Cases ***

Cenário: Fluxo Completo Add Transfer Delet 
    Login User Gui
    Adicionar Cartão
    Bloqueio Cartão
    Desbloqueio Cartão
    Transferencia
    Excluir Cartao

Cenário: Bloqueio Cartão
    Login User Gui
    Bloqueio Cartão

Cenário: Transferecia e Update
    Login User Gui
    Transferencia

Cenário: Pagamento de boleto
    Login User Gui
    Pagamento Boleto

Cenário: Swipe
    Login User Gui
    Swipe Tela Test
    
