*** Settings ***
Library    AppiumLibrary    timeout=30s

Resource    resources/utils/openApp.resource

Library    yaml
### Variaveis
Resource    resources/locators/variaveis.resource

### Utils
Resource    resources/utils/login.resource

### Pages
Resource    resources/pages/add_card_v2.robot