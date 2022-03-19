*** Settings ***
Library                    SeleniumLibrary
Library                    ../custom_libraries/chromedriver_manager.py

*** Keywords ***
Start Browser and Maximize using ChromedriverManager
    ${driver}=    Chromedriver_manager.Get Chromedriver Path
    log    ${driver}  
    Create Webdriver    Chrome    executable_path=${driver}  
    Maximize Browser Window




Close all browsers sessions
    Close All Browsers