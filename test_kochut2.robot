*** Settings ***
#Library  Selenium2Library

Resource          _resource.robot
Test Setup        Prepare Test Environment

Test Teardown   Close All Browsers

*** Test Cases ***

Login Test
	Open Browser  https://kochut.org/  Chrome
	Click Link  css=.login__button
	Input Text  css=#input-email  liudapqa+test@gmail.com
	Input Text  css=#input-password  test100818
	Click Element  css=input.total-wrap__button
	Page Should Contain  Мій обліковий запис
	Page Should Contain  Мої замовлення
	Page Should Contain Element  css=ul.list-unstyled:nth-child(2) > li:nth-child(1) > a:nth-child(1)

Go to shop Test
	Open Browser  https://kochut.org/  Chrome
	Click Link  css=div.main-page__menu:nth-child(3) > ul:nth-child(1) > li:nth-child(1) > a:nth-child(1)
	Click Link  css=div.item-group:nth-child(2) > a:nth-child(1)
	Page Should Contain  Золоті та срібні каблучки Кочут

Add to cart Test
    Open Browser  https://kochut.org/shop/rings/ring-the-sun-of-the-desert-silver-gold-ruby.html  Chrome
    Click Link  css=#button-cart
    Sleep  5s
    Page Should Contain   Товар Каблучка "Сонце пустелі". Срібло, золото, рубін доданий в Ваший кошик!

Check the cart Test
    Open Browser  https://kochut.org/shop/rings/ring-the-sun-of-the-desert-silver-gold-ruby.html  Chrome
    Click Link  css=#button-cart
    Sleep  5s
    Page Should Contain   Товар Каблучка "Сонце пустелі". Срібло, золото, рубін доданий в Ваший кошик!
    Click Link  css=#product > div.alert.alert-success > a:nth-child(3)
    Page Should Contain  Оформлення замовлення
    Page Should Contain  $305

#окремий кейворд для логіна, для речей які повторюються
#селектори і змінні занести в ресорс
#замінити сліпи на вейти


