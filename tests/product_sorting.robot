*** Settings ***
Library    Browser
Resource    ../resource/common.resource
Resource    ../page/loginpage.resource
Resource    ../page/homepage.resource
Resource    ../page/products.resource

Test Setup        Open Application
Test Teardown     Close Application

*** Test Cases ***
TC03_Verify the products are loaded in Ascending order
    Login into Application
    Verify the homepage loaded
    Verify all products are sorted into Ascending order

TC04_Verify the products are loaded in Descending order
    Login into Application
    Verify the homepage loaded
    Verify all products are sorted into Descending order

TC05_Verify the products are loaded in Ascending order with respect to price (low to high)
    Login into Application
    Verify the homepage loaded
    Verify all products are sorted according to price (low to high)

TC06_Verify the products are loaded in Ascending order with respect to price (high to low)
    Login into Application
    Verify the homepage loaded
    Verify all products are sorted according to price (high to low)