*** Settings ***
Library           Selenium2Library  30  15

*** Variables ***
${BROWSER}        Chrome
${URL}      http://kochut.org/
${RING URL}      ${URL}/shop/rings/ring-the-sun-of-the-desert-silver-gold-ruby.html
${VALID USER}     liudapqa+test@gmail.com
${VALID PASSWORD}    test100818
${INVALID USER}     l1@gmail.com
${INVALID PASSWORD}    te
${LOGIN BUTTON}    css=.login__button
${ADD TO CART BUTTON}    css=#button-cart
${CONFIRM RING TEXT}    Товар Каблучка "Сонце пустелі". Срібло, золото, рубін доданий в Ваший кошик!
${OPEN CART PAGE}    css=#product > div.alert.alert-success > a:nth-child(3)
${INPUT EMAIL}    css=#input-email
${INPUT PASSWORD}    css=#input-password
${CLICK LOGIN}    css=input.total-wrap__button
${GO TO SHOP}    css=div.main-page__menu:nth-child(3) > ul:nth-child(1) > li:nth-child(1) > a:nth-child(1)
${GO TO RINGS}    css=div.item-group:nth-child(2) > a:nth-child(1)
${LANGUAGES BLOK}    css=.languages.main-page__info-block-item
${ENG LANGUAGE}    ${LANGUAGES BLOK} > ul > li:nth-child(3)
${INVALID LOGIN ERROR}  Неправильно заповнені поля E-Mail і / або пароль!
${DELETE FROM CART}  css=.item-cart__close
${INCREASE ITEM}  css=span.count__max
${CART TOTAL}  css=.total-wrap__cost-count
${SEARCH BUTTON}  css=#search > button
${SEARCH INPUT}  css=#search-input
${SEARCH START}  css=#search > div > button
${SEARCH RESULT SUM}  css=#content > div.catalog__top > div:nth-child(1) > span > strong


*** Keywords ***
Prepare Test Environment
    Open Browser  ${URL}  ${BROWSER}

Open Ring Page
    Open Browser  ${RING URL}  ${BROWSER}

Submit Ring Adding To The Cart
    Wait Until Page Contains  ${CONFIRM RING TEXT}  30
    Page Should Contain   ${CONFIRM RING TEXT}

Login
    [Arguments]  ${email}  ${password}
    Click Link  ${LOGIN BUTTON}
	Input Text  ${INPUT EMAIL}  ${email}
	Input Text  ${INPUT PASSWORD}  ${password}
	Click Element  ${CLICK LOGIN}

