*** Settings ***
Library    Browser
Library    String
Library    Collections

*** Variables ***
${add_cart}              xpath=//*[contains(text(),"PRODUCT_NAME")]/ancestor::div[@class='inventory_item']//button
${cart_click}            xpath=//*[@class='shopping_cart_link']
${cart_items}            xpath=//div[@class='cart_item']
${cart_items_name}       xpath=//*[@class='inventory_item_name']
${cart_badge}            xpath=//*[@data-test='shopping-cart-badge']
${remove_cart}           xpath=//*[contains(text(),"PRODUCT_NAME")]/ancestor::div[@class='inventory_item']//button[contains(.,"Remove")]
${remove_cart_item}      xpath=//*[contains(text(),"PRODUCT_NAME")]/ancestor::div[@class='cart_item']//button[contains(text(),'Remove')]
${SELECTED_PRODUCTS} 
${product_count}  

*** Keywords ***
Adding product to cart
    [Arguments]    @{product_name}
    ${products}=    Create List    @{product_name}
    Set Test Variable    ${SELECTED_PRODUCTS}     ${products}
    ${product_count}=    Get Length    ${products}
    Set Test Variable    ${product_count}    ${product_count}
    FOR    ${each_product}    IN    @{product_name}
        ${add_product_name_cart}=    Replace String    ${add_cart}    PRODUCT_NAME    ${each_product}
        Click    ${add_product_name_cart}       
    END

Verify cart items
    Log To Console     ${SELECTED_PRODUCTS}
    Click    ${cart_click}
    ${product_items}=    Get Elements   ${cart_items_name}
    ${count}=    Get Length   ${product_items}
    Log To Console     ${count}
    ${product_name_count}=    Get Length    ${SELECTED_PRODUCTS}
    Log To Console     ${product_name_count}
    Should Be Equal As Integers     ${count}    ${product_name_count}
    FOR    ${index}   IN RANGE     ${count}
        Log To Console    Before:${index}
        ${each_product_name_text}=    Get From List  ${product_items}    ${index}
        ${actual}=    Get Text     ${each_product_name_text}      
        Log To Console    After:${actual}
        Log To Console    ${SELECTED_PRODUCTS}[${index}]
        Should Be Equal     ${actual}   ${SELECTED_PRODUCTS}[${index}]
    END

Verify cart badge count
    ${expected_count}=    Get Length    ${SELECTED_PRODUCTS}
    Log To Console    expected_count=${expected_count}
    ${badge_exists}=    Get Element Count     ${cart_badge}
    Log To Console    badge_exists=${badge_exists}
    IF    ${expected_count} == 0
        Should Be Equal As Integers    ${badge_exists}    0
    ELSE
        ${cart_badge_count}=    Get Text    ${cart_badge}
        Log To Console    count=${cart_badge_count}
        Should Be Equal As Integers    ${expected_count}    ${cart_badge_count}
    END
    
Remove product from page
    [Arguments]    @{product_name}
    FOR     ${each_product}    IN    @{product_name}
        ${remove_product_name_cart}=    Replace String    ${remove_cart}   PRODUCT_NAME   ${each_product}
        Click    ${remove_product_name_cart}
        Remove Values From List    ${SELECTED_PRODUCTS}     ${each_product}
    END

Remove product from cart page
    Click    ${cart_badge}
    [Arguments]    @{product_name}
    FOR    ${each_product}    IN    @{product_name}
        ${remove_product_name_cart}=    Replace String    ${remove_cart_item}   PRODUCT_NAME   ${each_product}
        Click    ${remove_product_name_cart}
        Remove Values From List    ${SELECTED_PRODUCTS}   ${each_product} 
    END
    


    