*** Settings ***
Library    Browser
Resource    ../resource/common.resource
Resource    ../page/loginpage.resource
Resource    ../page/homepage.resource
Resource    ../page/products.resource

Test Setup        Open Application
Test Teardown     Close Application

*** Test Cases ***
TC02_Verify all the products list are loaded
    Login into Application
    Verify the homepage loaded
    Verify all products are loaded