*** Settings ***

Resource          _resource.robot
Test Setup        Prepare Test Environment
Test Teardown   Close All Browsers


*** Test Cases ***

Login Test
	Click Link  ${LOGIN BUTTON}
	Input Text  ${INPUT EMAIL}  ${VALID USER}
	Input Text  ${INPUT PASSWORD}  ${VALID PASSWORD}
	Click Element  ${CLICK LOGIN}
	Page Should Contain  Мій обліковий запис
	Page Should Contain  Мої замовлення

Go to shop Test
	Click Link  ${GO TO SHOP}
	Click Link  ${GO TO RINGS}
	Page Should Contain  Золоті та срібні каблучки Кочут

Add to cart Test
    [Setup]  Open Ring Page
    Click Link  ${ADD TO CART BUTTON}
    Submit Ring Adding To The Cart

Check the cart Test
    [Setup]  Open Ring Page
    Click Link  ${ADD TO CART BUTTON}
    Submit Ring Adding To The Cart
    Click Link  ${OPEN CART PAGE}
    Page Should Contain  Оформлення замовлення
    Page Should Contain  $305






