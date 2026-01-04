*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CHROME_BROWSER_PATH}    ${EXECDIR}${/}ChromeForTesting${/}chrome-win64${/}chrome.exe
${CHROME_DRIVER_PATH}     ${EXECDIR}${/}ChromeForTesting${/}chromedriver-win64${/}chromedriver.exe
${SERVER}         localhost:7272
${BROWSER}        chrome
${DELAY}          0
${LOGIN URL}      http://${SERVER}/
${REGISTRATION URL}    http://${SERVER}/Registration.html
${SUCCESS URL}      http://${SERVER}/Success.html

*** Test Cases ***
Open Workshop Registration Page
    Open Browser    ${REGISTRATION URL}    ${BROWSER}
    Set Selenium Speed    ${DELAY}

Register Success
    input text   id=firstname    Somyod
    input text   id=lastname    Sodsai
    input text   id=organization    CS KKU
    input text   id=email    somyod@kkumail.com
    input text   id=phone    091-001-1234
    click button    id=registerButton

    location should contain    ${SUCCESS URL}
    title should be    Success
    page should contain   Thank you for registering with us.
    page should contain   We will send a confirmation to your email soon.
    sleep    2s
    close browser
    
Open Workshop Registration Page wihtout Organization Info
    Open Browser    ${REGISTRATION URL}    ${BROWSER}
    Set Selenium Speed    ${DELAY}
    
Register Success No Organization Info
    input text   id=firstname    Somyod
    input text   id=lastname    Sodsai
    input text   id=email    somyod@kkumail.com
    input text   id=phone    091-001-1234
    click button    id=registerButton

    location should contain    ${SUCCESS URL}
    title should be    Success
    page should contain   Thank you for registering with us.
    page should contain   We will send a confirmation to your email soon.
    sleep    2s
    close browser
