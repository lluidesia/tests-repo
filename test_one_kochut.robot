*** Settings ***
Library  Selenium2Library

#Resource          _resource.robot
#Test Setup        Prepare Test Environment

Test Teardown   Close All Browsers

*** Test Cases ***

Check the cart Test
    Open Browser  https://kochut.org/shop/rings/ring-the-sun-of-the-desert-silver-gold-ruby.html  Chrome
    Click Link  css=#button-cart
    #Sleep  5s
    Wait Until Page Contains  Товар Каблучка "Сонце пустелі". Срібло, золото, рубін доданий в Ваший кошик!  30
    Page Should Contain   Товар Каблучка "Сонце пустелі". Срібло, золото, рубін доданий в Ваший кошик!
    Click Link  css=#product > div.alert.alert-success > a:nth-child(3)




