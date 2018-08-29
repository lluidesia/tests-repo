*** Settings ***

Resource          _resource.robot
Test Setup        Prepare Test Environment
Test Teardown     Close All Browsers


*** Test Cases ***

Login Test
	Login  ${VALID USER}  ${VALID PASSWORD}
	Page Should Contain  Мій обліковий запис
	Page Should Contain  Мої замовлення

Login Negative Test
	Login  ${INVALID USER}  ${INVALID PASSWORD}
	Page Should Contain  ${INVALID LOGIN ERROR}

Login Invalid User Test
	Login  ${INVALID USER}  ${VALID PASSWORD}
	Page Should Contain  ${INVALID LOGIN ERROR}

Login Invalid Password Test
	Login  ${VALID USER}  ${INVALID PASSWORD}
	Page Should Contain  ${INVALID LOGIN ERROR}

Login Empty Fields Test
	Login   ${EMPTY}  ${EMPTY}
	Page Should Contain  ${INVALID LOGIN ERROR}

Login Empty Password Test
	Login   ${VALID USER}  ${EMPTY}
	Page Should Contain  ${INVALID LOGIN ERROR}

Login Empty User Test
	Login   ${EMPTY}  ${VALID PASSWORD}
	Page Should Contain  ${INVALID LOGIN ERROR}

