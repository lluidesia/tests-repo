*** Settings ***
Library  Selenium2Library

Resource          _resource.robot
Test Setup        Prepare Test Environment
#Test Teardown   Close All Browsers

*** Test Cases ***

#testing small tests before adding to main files

Change Language To Eng Test
	Click Element  ${LANGUAGES BLOK}
	#Sleep  3
	#Wait Until Page Contains  ${ENG LANGUAGE}  15
	#Click Link  ${ENG LANGUAGE}
	#Sleep  3
	Click Link  css=.languages.main-page__info-block-item > ul > li:nth-child(3) > a
	#Sleep  3
	Wait Until Page Contains  Shop
	Page Should Contain  Shop






