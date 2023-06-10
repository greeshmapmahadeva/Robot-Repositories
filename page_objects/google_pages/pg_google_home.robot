*** Settings ***
Library                    SeleniumLibrary
Library    webdriver_manager.chrome

Library                        ../custom_libraries/webdriversync.py



*** Variables ***
${site_url}                 https://www.google.com
${title_url}                Google
${ele_search}               xpath://*[@title=\'Search\']
${ele_btn_search}           (//li[@role='presentation'])[2]






*** Keywords ***
# Create Webdriver for chrome
#     ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
#     Call Method    ${options}    add_argument    --headless
#     Create Webdriver    Chrome    options=${options}    executable_path=${ChromeDriverManager(version="114.0.5735.90").install()}
Navigate to Webpage
    [Arguments]    ${driver}
    IF    '${driver}' == 'chrome'
        ${chromedriver_path}=   webdriversync.Get Chromedriver Path
        Create Webdriver    Chrome   executable_path=${chromedriver_path}
    ELSE
        ${chromedriver_path}=   webdriversync.Get Geckodriver Path
        Create Webdriver    Firefox   executable_path=${chromedriver_path}
    END
    
    Go To    ${site_url}
    Click Element    id:W0wltc

Webpage is open and title is visible
    Title Should Be        ${title_url}
Search something in google search bar
    [Arguments]        ${searchitem}
    Wait Until Element Is Visible    ${ele_search}    5s
    Input Text    ${ele_search}    ${searchitem}
    Sleep    1s
    Click Element    //input[@value='Google Search']
    #Sleep    1s
    #Click Element    ${ele_btn_search}

Validate search results has ${searchitem}
    Wait Until Page Contains    Google
    Page Should Contain    ${searchitem}

Click on first link that contains Robot Framework and validate title
    [Arguments]        ${searchitem}    ${title}
    
    Click Element    xpath=//h3[text()=\'${searchitem}']



    Wait Until Page Contains Element    //title[text()=\'${title}\']    10
    # Sleep    3
    Title Should Be    ${title}
    
    Capture Page Screenshot
