*** Settings ***
Library  Selenium2Library

Resource          _resource.robot
#Test Setup        Prepare Test Environment
#Test Teardown   Close All Browsers

*** Test Cases ***

#testing small tests before adding to main files
Increase Items In Cart Test
    [Setup]  Open Ring Page
    Click Link  ${ADD TO CART BUTTON}
    Submit Ring Adding To The Cart
    Click Link  ${OPEN CART PAGE}
    Click Element  ${INCREASE ITEM}
    #Sleep  3
    #Wait Until Page Contains  css=#total_total > span.total-wrap__cost-count  15
    Wait Until Element Contains  css=.total-wrap__cost-count  $610  30

