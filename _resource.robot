*** Settings ***
Library           Selenium2Library  30  15

*** Variables ***
${BROWSER}        Chrome
${URL}      http://kochut.org/
${RING URL}      ${URL}/shop/rings/ring-the-sun-of-the-desert-silver-gold-ruby.html
${VALID USER}     liudapqa+test@gmail.com
${VALID PASSWORD}    test100818
${LOGIN BUTTON}    css=.login__button
${ADD TO CART BUTTON}    css=#button-cart
${CONFIRM RING TEXT}    Товар Каблучка "Сонце пустелі". Срібло, золото, рубін доданий в Ваший кошик!
${OPEN CART PAGE}    css=#product > div.alert.alert-success > a:nth-child(3)
${INPUT EMAIL}    css=#input-email
${INPUT PASSWORD}    css=#input-password
${CLICK LOGIN}    css=input.total-wrap__button
${GO TO SHOP}    css=div.main-page__menu:nth-child(3) > ul:nth-child(1) > li:nth-child(1) > a:nth-child(1)
${GO TO RINGS}    css=div.item-group:nth-child(2) > a:nth-child(1)

*** Keywords ***
Prepare Test Environment
    Open Browser  ${URL}  ${BROWSER}

Open Ring Page
    Open Browser  ${RING URL}  ${BROWSER}

Submit Ring Adding To The Cart
    Wait Until Page Contains  ${CONFIRM RING TEXT}  30
    Page Should Contain   ${CONFIRM RING TEXT}