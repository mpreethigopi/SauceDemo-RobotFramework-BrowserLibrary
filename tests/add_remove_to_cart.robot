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
TC07_Verify add single item to the cart
    Login into Application
    Verify the homepage loaded
    Adding product to cart 
    ...    Sauce Labs Fleece Jacket       
    Verify cart badge count
    Verify cart items

TC08_Verify add multiple item to the cart
    Login into Application
    Verify the homepage loaded
    Adding product to cart
    ...    Sauce Labs Onesie
    ...    Test.allTheThings() T-Shirt (Red)
    ...    Sauce Labs Bike Light
    Verify cart badge count
    Verify cart items

TC09_Verify remove single item from product page
    Login into Application
    Verify the homepage loaded
    Adding product to cart        
    ...    Sauce Labs Fleece Jacket
    Remove product from page
    ...    Sauce Labs Fleece Jacket
    Verify cart badge count

TC10_Verify remove multiple item from product page
    Login into Application
    Verify the homepage loaded
    Adding product to cart
    ...    Sauce Labs Onesie
    ...    Test.allTheThings() T-Shirt (Red)
    ...    Sauce Labs Bike Light
    Remove product from page
    ...    Sauce Labs Onesie
    ...    Test.allTheThings() T-Shirt (Red)
    Verify cart badge count

TC11_Verify remove single item from cart page
    Login into Application
    Verify the homepage loaded
    Adding product to cart        
    ...    Sauce Labs Fleece Jacket
    Remove product from cart page
    ...    Sauce Labs Fleece Jacket
    Verify cart badge count

TC12_Verify remove single item from cart page
    Login into Application
    Verify the homepage loaded
    Adding product to cart        
    ...    Sauce Labs Fleece Jacket
    ...    Sauce Labs Onesie
    ...    Test.allTheThings() T-Shirt (Red)
    ...    Sauce Labs Bike Light
    Remove product from cart page
    ...    Sauce Labs Fleece Jacket
    ...    Sauce Labs Onesie
    ...    Test.allTheThings() T-Shirt (Red)
    Verify cart badge count