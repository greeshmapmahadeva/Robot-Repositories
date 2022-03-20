*** Settings ***
Library                    SeleniumLibrary

*** Variables ***
${site_url}                 https://www.google.com
${title_url}                Google
${ele_search}               xpath://input[@title=\'Search\']
${ele_btn_search}           xpath:(//*[@value='Google Search'])[2]






*** Keywords ***
Navigate to Webpage
    Go To    ${site_url}

Webpage is open and title is visible
    Title Should Be        ${title_url}
Search something in google search bar
    [Arguments]        ${searchitem}
    Input Text    ${ele_search}    ${searchitem}
    Click Element    ${ele_btn_search}

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
