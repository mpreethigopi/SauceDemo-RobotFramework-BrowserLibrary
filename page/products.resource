*** Settings ***
Library    Browser
Library    Collections

*** Variables ***
${all_products}        xpath=//*[@class='inventory_container']
${product_name}        xpath=//*[normalize-space(@class)='inventory_item_name']
${product_price}       xpath=//*[contains(@class,'inventory_item_price')]
${product}             css=.inventory_item
${select_sort}          xpath=//*[@class='product_sort_container']

*** Keywords ***

Check Products are loaded
    Wait For Elements State    ${all_products}    visible    10s

Get Product Details
    ${products}=    Get Elements    ${product}
    Length Should Be    ${products}    6

    FOR    ${item}    IN    @{products}
        ${name}=     Get Text    ${item} >> ${product_name}
        ${price}=    Get Text    ${item} >> ${product_price}

        Log To Console    ${name} - ${price}

        Should Not Be Empty    ${name}
        Should Not Be Empty    ${price}
    END

Sorting the Products Ascending
    Select Options By     ${select_sort}     label    Name (A to Z)
    Wait Until Keyword Succeeds    5x    1s    Verify Products Sorted

Sorting the Products Descending
    Select Options By     ${select_sort}    label    Name (Z to A)
    Wait Until Keyword Succeeds    5x    1s    Verify Products Sorted

Sorting the Products according to price (low to high)
   Select Options By     ${select_sort}    label    Price (low to high)
   Wait Until Keyword Succeeds    5x    2s    Verify Products Sorted

Sorting the Products according to price (high to low)
   Select Options By     ${select_sort}    label    Price (high to low)
   Wait Until Keyword Succeeds    5x    2s    Verify Products Sorted

Verify Products sorted
    ${elements}=    Get Elements    ${product_name} 
    Log To Console    ${elements}
    ${products}=    Create List

    FOR    ${element}    IN    @{elements}
        ${text}=    Get Text    ${element}
        Log To Console    ${text}
        Append To List    ${products}    ${text}
    END
    Wait For Load State    networkidle    timeout=50s

Verify all products are loaded
    Check Products are loaded
    Get Product Details

Verify all products are sorted into Ascending order
    Sorting the Products Ascending

Verify all products are sorted into Descending order   
    Sorting the Products Descending

Verify all products are sorted according to price (low to high)
    Sorting the Products according to price (low to high)

Verify all products are sorted according to price (high to low)
    Sorting the Products according to price (high to low)
    