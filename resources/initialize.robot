*** Settings ***
Library                    SeleniumLibrary
Library                    ../custom_libraries/chromedriver_manager.py
Library                    ../custom_libraries/geckodriver_manager.py


*** Keywords ***
Start Browser and Maximize using ChromedriverManager
    ${driver}=    Chromedriver_manager.Get Chromedriver Path
    log    ${driver}  
    Create Webdriver    Chrome    executable_path=${driver}  
    Maximize Browser Window

Start Browser and Maximize using ChromedriverManager-headlesschrome
    ${chrome_options} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}   add_argument    headless
    Call Method    ${chrome_options}   add_argument    disable-gpu
    ${options}=     Call Method     ${chrome_options}    to_capabilities 
    ${driver}=    Chromedriver_manager.Get Chromedriver Path    
    log    ${driver}  
    Create Webdriver    Chrome    executable_path=${driver}    desired_capabilities=${options}  
    Maximize Browser Window


Close all browsers sessions
    Close All Browsers


Running the tests in chrome headless
    ${driver}=    Chromedriver_manager.Get Chromedriver Path    
    log    ${driver}  
    ${chrome options} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome options}   add_argument    headless
    Call Method    ${chrome options}   add_argument    disable-gpu
    Create Webdriver    Chrome    chrome_options=${chrome options}    executable_path=${driver}

Running the tests in firefox headless
    ${driver}=    Geckodriver_manager.Get Geckodriver Path    
    log    ${driver}  
    ${chrome options} =     Evaluate    sys.modules['selenium.webdriver'].FirefoxOptions()    sys, selenium.webdriver
    Call Method    ${chrome options}   add_argument    headless
    Call Method    ${chrome options}   add_argument    disable-gpu
    Create Webdriver    Firefox    options=${chrome options}    executable_path=${driver}  

Running the tests in firefox webdrivermanager
    ${driver}=    Geckodriver_manager.Get Geckodriver Path
    Open Browser    about:blank    headlessfirefox    executable_path=${driver}


# Running the tests in Opera webdrivermanager
#     ${driver}=    Operadriver_manager.Get Operadriver Path
#     Open Browser    about:blank    opera    executable_path=${driver}
