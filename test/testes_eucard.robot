
*** Settings ***
Resource    ../base.resource
Resource    ../resources/utils/login.resource
Test Setup    OpenEucard
*** Test Cases ***

Cenário: Add Card delet Card   
    Login User Teste 224
    Adicionar Cartão - Fluxo Completo
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