
*** Settings ***
Resource    ../base.resource
Resource    ../resources/utils/login.resource
Test Setup    OpenEucard
*** Test Cases ***

Cenário: Add Card delet Card   
    Login User Teste 287
    Adicionar Cartão - Fluxo Completo
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