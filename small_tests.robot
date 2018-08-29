*** Settings ***
Library  Selenium2Library

Resource          _resource.robot
#Test Setup        Prepare Test Environment

#Test Teardown   Close All Browsers

*** Test Cases ***


Delete From Cart Test
    [Setup]  Open Ring Page
    Click Link  ${ADD TO CART BUTTON}
    Submit Ring Adding To The Cart
    Click Link  ${OPEN CART PAGE}
    Click Element  ${DELETE FROM CART}
    Wait Until Page Contains  Ваш кошик порожній!  30
    Page Should Contain  Ваш кошик порожній!


