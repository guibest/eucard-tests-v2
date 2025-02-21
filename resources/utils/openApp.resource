*** Settings ***

Resource    ../../base.resource

*** Keywords ***

OpenEucard
   Open Application    
    ...    remote_url=127.0.0.1:4723
    ...    automationName=UiAutomator2
    ...    platformName=Android
    ...    platformversion=15
    ...    deviceName=emulator-5554
    ...    appWaitPackage=br.com.eucard
    ...    appPackage=br.com.eucard
    ...    appWaitActivity=br.com.eucard.MainActivity
    ...    appActivity=.MainActivity
    ...    disableIdLocatorAutocompletion=${True}
    ...    disableWindowAnimation=${True}
   