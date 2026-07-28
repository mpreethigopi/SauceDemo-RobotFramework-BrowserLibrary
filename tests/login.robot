*** Settings ***
Library    Browser
Resource    ../resource/common.resource
Resource    ../page/loginpage.resource
Resource    ../page/homepage.resource

Test Setup        Open Application
Test Teardown     Close Application

*** Test Cases ***
TC01_Verify user can login
    Login into Application
    Verify the homepage loaded