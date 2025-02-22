*** Settings ***
Library    AppiumLibrary    timeout=30s

Resource    resources/utils/openApp.resource

### Variaveis
Resource    resources/locators/variaveis.resource

### Utils
Resource    resources/utils/login.resource

### Pages
Resource    resources/pages/add_card_v2.robot
Resource    resources/pages/delet_card.robot
Resource    resources/pages/block_card.robot
Resource    resources/pages/unlock_card.robot