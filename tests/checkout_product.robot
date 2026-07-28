*** Settings ***
Library    Browser
Resource    ../resource/common.resource
Resource    ../page/loginpage.resource
Resource    ../page/homepage.resource
Resource    ../page/add_remove_to_cart.resource
Resource    ../page/checkoutpage.resource

Test Setup        Open Application
Test Teardown     Close Application

*** Keywords ***

*** Test Cases ***
TC13_Verify add single item to the cart
    Login into Application
    Verify the homepage loaded
    Adding product to cart 
    ...    Sauce Labs Fleece Jacket       
    Verify cart badge count
    Verify cart items 
    Checkout the products