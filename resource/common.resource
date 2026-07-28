*** Settings ***
Library    Browser

*** Keywords ***
Open Application
    New Browser    chromium    headless=False    args=["--start--maximized"]
    New Context
    New Page    https://www.saucedemo.com

Close Application
    Close Browser

