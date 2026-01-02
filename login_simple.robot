*** Settings ***
Library    SeleniumLibrary
Test Teardown    Run Keyword If Test Failed    Capture Page Screenshot
# Suite Setup    Open Browser To Login Page
# Suite Teardown    Close Browser

*** Variables ***
${URL}                  https://play1.automationcamp.ir/login.html
${BROWSER}              chrome
${EMAIL}                admin
${PASSWORD}             admin
${LOC_LOGIN_BOX_ID}     user
${LOC_PASS_BOX_ID}      password
${LOC_SUBM_BTN_ID}      login
${LOC_BELKA_XPATH}      xpath=//div[contains(concat(' ', @class,' '),'card-header bg-info text-white') and contains(normalize-space(),'Pizza House')]
${LOC_BELKA_EXP_TXT}    Pizza House
@{LOC_H1_TEXT}          ${LOC_BELKA_XPATH}    ${LOC_BELKA_EXP_TXT}

*** Test Cases ***
Simple Login Test
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    id=${LOC_LOGIN_BOX_ID}    10s
    Input Text      id=${LOC_LOGIN_BOX_ID}     ${EMAIL}
    Input Password  id=${LOC_PASS_BOX_ID}      ${PASSWORD}
    Click Button    id=${LOC_SUBM_BTN_ID}
    Wait Until Element Is Visible    ${LOC_BELKA_XPATH}    10s
    # Wait Until Page Contains    GMLK-CMS - GUMULAK.PL    10s
    # Wait Until Element Contains    @{LOC_H1_TEXT}    15s
    [Teardown]    Close Browser