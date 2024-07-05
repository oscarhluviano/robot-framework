*** Settings ***
Documentation   Basic test to verify Robot Framework functionality

Resource    ../resources/keywords/browser.resource

*** Test Cases ***
Robot Framework Basic Test
    [Documentation]    Verifies Robot Framework functionality
    [Tags]    basic    sanity
    Log    Hello, Robot Framework!
    ${result}    Set Variable    Hello, Robot Framework!
    Should Be Equal    ${result}    Hello, Robot Framework!

Chrome Basic Test
    [Documentation]    Opens Chrome and verifies basic functionality
    [Tags]    basic    sanity    chrome
    Open Chrome Navigator    google   
    Go To    https://www.google.com/
    Wait Until Element Is Visible    xpath: //img[contains(@alt, 'Google')]    10
    Close Browser