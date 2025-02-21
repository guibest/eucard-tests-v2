*** Settings ***
Library    AppiumLibrary    timeout=30s

Resource    resources/utils/openApp.resource

Library    yaml

### Variaveis
Variables    resources/locators/variaveis.yml