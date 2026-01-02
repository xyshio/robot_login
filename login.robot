*** Settings ***
Library    SeleniumLibrary
#Test Teardown    Capture Page Screenshot
Test Teardown    Run Keyword If Test Failed    Capture Page Screenshot
Suite Setup    Open Browser To Login Page
Suite Teardown    Close Browser

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
User Can Log In
    Input Email
    Input Password
    Submit Login Form
    Login Should Be Successful

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    id=${LOC_LOGIN_BOX_ID}    10s

Input Email
    SeleniumLibrary.Input Text  id=${LOC_LOGIN_BOX_ID}  ${EMAIL}

Input Password
    SeleniumLibrary.Input Password  id=${LOC_PASS_BOX_ID}  ${PASSWORD}

Submit Login Form
    SeleniumLibrary.Click Button  id=${LOC_SUBM_BTN_ID}

Login Should Be Successful
    Wait Until Element Is Visible    ${LOC_BELKA_XPATH}    10s
    # Wait Until Element Contains    @{LOC_H1_TEXT}    15s
    # Wait Until Page Contains    ${LOC_BELKA_EXP_TXT}    10s
    # Wait Until Element Contains    xpath=//h1    GMLK-CMS - GUMULAK.PL    15s
    # Wait Until Element Contains    css=h1.belkanazwy    GMLK-CMS - GUMULAK.PL    15s
    # Wait Until Element Contains    id=pageTitle    GMLK-CMS - GUMULAK.PL    15s

# SHORT
# *** Test Cases ***
# Login
#     Open Browser    https://gumulak.pl/fim    chrome
#     Input Text      id=loginx     master
#     Input Password  id=passx  blaster
#     Click Button    id=submitx
#     Page Should Contain    GMLK-CMS - GUMULAK.PL
#     Wait Until Element Contains    css=h1.belkanazwy    GMLK-CMS - GUMULAK.PL    15s
#     Close Browser
