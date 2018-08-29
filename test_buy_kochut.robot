*** Settings ***

Resource          _resource.robot
Test Setup        Open Ring Page
Test Teardown     Close All Browsers


*** Test Cases ***

Add To Cart Test
    Click Link  ${ADD TO CART BUTTON}
    Submit Ring Adding To The Cart

Check The Cart Test
    Click Link  ${ADD TO CART BUTTON}
    Submit Ring Adding To The Cart
    Click Link  ${OPEN CART PAGE}
    Page Should Contain  Оформлення замовлення
    Page Should Contain  $305

Delete From Cart Test
    Click Link  ${ADD TO CART BUTTON}
    Submit Ring Adding To The Cart
    Click Link  ${OPEN CART PAGE}
    Click Element  ${DELETE FROM CART}
    Wait Until Page Contains  Ваш кошик порожній!  30
    Page Should Contain  Ваш кошик порожній!



