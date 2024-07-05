*** Settings ***
Library  SeleniumLibrary
Library    OperatingSystem

*** Keywords ***
Open Chrome Navigator
    [Arguments]    ${alias}    ${headless}=False
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Run Keyword If    '${headless}' == 'True'    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    ${ws}=    Set Variable    window-size=1920,1080
    Call Method    ${chrome_options}    add_argument    ${ws}
    ${driver}=    Evaluate    sys.modules['webdriver_manager.chrome'].ChromeDriverManager().install()    sys, webdriver_manager.chrome
    Create Webdriver    Chrome    chrome_options=${chrome_options}    executable_path=${driver}    alias=${alias}
