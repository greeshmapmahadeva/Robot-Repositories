*** Settings ***
Library                        SeleniumLibrary
Library                        ../custom_libraries/chromedriver_manager.py
Resource                       ../resources/initialize.robot
Resource                       ../page_objects/all_page_objects.robot
Resource                       ../resources/initialize.robot
# Resource                       ../page_objects/pg_google_home.robot
Suite Setup                    Run Keyword
                               ...  Running the tests in firefox webdrivermanager


                

Suite Teardown                 Close all browsers sessions


*** Variables ***
@{searchitem}               Robot Framework    Amazon.in    Flipkart
# ${searchitem_01}               Amazon.in
@{title}                    Robot Framework        Online Shopping site in India: Shop Online for Mobiles, Books, Watches, Shoes and More - Amazon.in        Online Shopping Site for Mobiles, Electronics, Furniture, Grocery, Lifestyle, Books & More. Best Offers!

*** Test Cases ***
TC_01 Goto ${site_url} and search Robot Framework
    Given Navigate to Webpage
    When Webpage is open and title is visible
    Then Search something in google search bar    ${searchitem}[0]
    And Validate search results has ${searchitem}[0]
    And Click on first link that contains Robot Framework and validate title        ${searchitem}[0]    ${title}[0]

TC_02 Goto ${site_url} and search Amazon
    Given Navigate to Webpage
    When Webpage is open and title is visible
    Then Search something in google search bar    ${searchitem}[1]
    And Validate search results has ${searchitem}[1]
    And Click on first link that contains Robot Framework and validate title        ${searchitem}[1]    ${title}[1]


TC_03 Goto ${site_url} and search Flipkart
    Given Navigate to Webpage
    When Webpage is open and title is visible
    Then Search something in google search bar    ${searchitem}[2]
    And Validate search results has ${searchitem}[2]
    And Click on first link that contains Robot Framework and validate title        ${searchitem}[2]    ${title}[2]

TC_04 Goto ${site_url} and search pypi
    Given Navigate to Webpage
    When Webpage is open and title is visible
    Then Search something in google search bar    ${searchitem}[3]
    And Validate search results has ${searchitem}[3]
    And Click on first link that contains Robot Framework and validate title        ${searchitem}[3]    ${title}[3]

TC_05 Goto ${site_url} and search Python
    Given Navigate to Webpage
    When Webpage is open and title is visible
    Then Search something in google search bar    ${searchitem}[4]
    And Validate search results has ${searchitem}[4]
    And Click on first link that contains Robot Framework and validate title        ${searchitem}[4]    ${title}[4]