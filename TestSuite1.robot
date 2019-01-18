*** Settings ***
Library    SeleniumLibrary

Suite Setup       Log    I am inside Test Suite setup
Suite Teardown    Log    I am inside Test Suite teardown
Test Setup        Log    I am inside Test Case setup
# Test Teardown     Log    I am inside Test Case teardown             

Default Tags    sanity

*** Test Cases ***
MyFirstTest
    Set Tags    smoke
    Log    Hello World..  
    
MySecondTest
    Set Tags    regression
    Log    How are you 
    Remove Tags    regression
    
FirstSeleniumTest
    # Create Webdriver    Chrome        executable_path=./../chromedriver.exe
    Open Browser        https://google.com    chrome 
    Set Browser Implicit Wait    5
    Input Text          name=q                Automation
    Press Keys          name=q                ENTER             
    Close Browser
    
LoginTest
    [Tags]    logintest
    Open Browser    ${URL}    chrome
    Set Browser Implicit Wait    5
    LOGIN
    Click Element     id=welcome   
    Click Element     link=Logout    
    Close Browser
    Log    This test was executed by %{username} on %{os}
        
*** Variables ***
${URL}    https://opensource-demo.orangehrmlive.com/
@{CREDENTIALS}    Admin    admin123  
&{LOGINDATA}    username=Admin    password=admin123

*** Keywords ***
LOGIN
    Input Text        id=txtUsername    @{CREDENTIALS}[0]
    Input Password    id=txtPassword    &{LOGINDATA}[password]
    Click Button      id=btnLogin 

    
    
    
    
    
    
    
    
    