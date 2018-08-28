*** Settings ***
Library  Selenium2Library

#Resource          _resource.robot
#Test Setup        Prepare Test Environment

#Test Teardown   Close All Browsers

*** Test Cases ***


Go to shop Test
	Open Browser  https://kochut.org/  Chrome
	Click Link  css=div.main-page__menu:nth-child(3) > ul:nth-child(1) > li:nth-child(3) > a:nth-child(1)
	Sleep  5
	Click Element  css=#send-request




