*** Settings ***
Library  Selenium2Library

Resource          _resource.robot
#Test Setup        Prepare Test Environment
#Test Teardown   Close All Browsers

*** Test Cases ***

#testing small tests before adding to main files
Search Test
    [Setup]  Prepare Test Environment
    Click Element  css=#search > button
    Input Text  css=#search-input  Мокуме
    Click Element  css=#search > div > button
    Wait Until Element Contains  css=#content > div.catalog__top > div:nth-child(1) > span > strong  71
    Page Should Contain  Пошук - Мокуме



