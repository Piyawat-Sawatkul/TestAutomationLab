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
Open Workshop Registration Page Empty First Name
    Open Browser    ${REGISTRATION URL}    ${BROWSER}
    Set Selenium Speed    ${DELAY}

Empty First Name
    input text   id=lastname    Sodsai
    input text   id=organization    CS KKU
    input text   id=email    somyod@kkumail.com
    input text   id=phone    091-001-1234
    click button    id=registerButton

    location should contain    ${REGISTRATION URL}
    page should contain  Please enter your first name!!
    close browser

Open Workshop Registration Page Empty Last Name
    Open Browser    ${REGISTRATION URL}    ${BROWSER}
    Set Selenium Speed    ${DELAY}

Empty Last Name
    input text   id=firstname    Somyod
    input text   id=organization    CS KKU
    input text   id=email    somyod@kkumail.com
    input text   id=phone    091-001-1234
    click button    id=registerButton

    location should contain    ${REGISTRATION URL}
    page should contain   Please enter your last name!!
    close browser

Open Workshop Registration Page Empty First Name and Last Name
    Open Browser    ${REGISTRATION URL}    ${BROWSER}
    Set Selenium Speed    ${DELAY}

Empty First Name and Last Name
    input text   id=organization    CS KKU
    input text   id=email    somyod@kkumail.com    
    input text   id=phone    091-001-1234
    click button    id=registerButton

    location should contain    ${REGISTRATION URL}
    page should contain   Please enter your name!!
    close browser

Open Workshop Registration Page Empty Email
    Open Browser    ${REGISTRATION URL}    ${BROWSER}
    Set Selenium Speed    ${DELAY}

Empty Email
    input text   id=firstname    Somyod
    input text   id=lastname    Sodsai
    input text   id=organization    CS KKU
    input text   id=phone    091-001-1234
    click button    id=registerButton

    location should contain    ${REGISTRATION URL}
    page should contain   Please enter your email!!
    close browser

Open Workshop Registration Page Empty Phone Number
    Open Browser    ${REGISTRATION URL}    ${BROWSER}
    Set Selenium Speed    ${DELAY}

Empty Phone Number
    input text   id=firstname    Somyod
    input text   id=lastname    Sodsai
    input text   id=organization    CS KKU
    input text   id=email    somyod@kkumail.com
    click button    id=registerButton

    location should contain    ${REGISTRATION URL}
    page should contain   Please enter your phone number!!
    close browser


Open Workshop Registration Page Invalid Phone Number
    Open Browser    ${REGISTRATION URL}    ${BROWSER}
    Set Selenium Speed    ${DELAY}

Invalid Phone Number
    input text   id=firstname    Somyod
    input text   id=lastname    Sodsai
    input text   id=organization    CS KKU
    input text   id=email    somyod@kkumail.com
    input text   id=phone    1234
    click button    id=registerButton

    location should contain    ${REGISTRATION URL}
    page should contain   Please enter a valid phone number, e.g., 081-234-5678, 081 234 5678, or 081.234.5678)
    close browser

