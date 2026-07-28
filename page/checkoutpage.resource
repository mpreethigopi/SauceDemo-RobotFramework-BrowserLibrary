*** Settings ***
Library    Browser
Library    FakerLibrary

*** Variables ***
${checkout}          xpath=//*[contains(text(),'Checkout')]
${fname}             xpath=//*[@name='firstName']
${lname}             xpath=//*[@id='last-name']
${postal_code}       xpath=//*[@name='postalCode']
${continue}          xpath=//*[@id='continue']
${finish}            xpath=//*[@name='finish']

*** Keywords ***
Checkout the products
    Click    ${checkout}
    ${firstname}=    FakerLibrary.First Name
    ${lastname}=    FakerLibrary.Last Name
    ${pcode}=    FakerLibrary.Postalcode
    Type Text    ${fname}    ${firstname}   
    Type Text    ${lname}    ${lastname}
    Type Text    ${postal_code}    ${pcode}
    Log To Console    Firstname=${firstname}
    Log To Console    Lastname=${lastname}
    Log To Console    Postalcode=${pcode}
    Click     ${continue}
    Click    ${finish} 