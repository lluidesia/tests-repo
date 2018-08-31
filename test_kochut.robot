*** Settings ***

Resource          _resource.robot
Test Setup        Prepare Test Environment
Test Teardown     Close All Browsers


*** Test Cases ***

Go to shop Test
	Click Link  ${GO TO SHOP}
	Click Link  ${GO TO RINGS}
	Page Should Contain  Золоті та срібні каблучки Кочут

Change Language To Eng Test
	Click Element  ${LANGUAGES BLOK}
	Click Element  ${ENG LANGUAGE}
	Page Should Contain  Shop

Search Test
    Click Element  ${SEARCH BUTTON}
    Input Text  ${SEARCH INPUT}  Мокуме
    Click Element  ${SEARCH START}
    Wait Until Element Contains  ${SEARCH RESULT SUM}  71
    Page Should Contain  Пошук - Мокуме

