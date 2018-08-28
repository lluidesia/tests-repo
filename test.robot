*** Settings ***
Library  Selenium2Library

#Resource          _resource.robot
#Test Setup        Prepare Test Environment

Test Teardown   Close All Browsers

*** Test Cases ***
Dummy Test
	Open Browser  https://kochut.org/  Chrome
	Click Link  css=.login__button
	Input Text  css=#input-email  liudapqa+test@gmail.com
	Input Text  css=#input-password  test100818
	Click Element  css=input.total-wrap__button
	Page Should Contain  Мій обліковий запис
	Page Should Contain  Мої замовлення
	Page Should Contain Element  css=ul.list-unstyled:nth-child(2) > li:nth-child(1) > a:nth-child(1)
