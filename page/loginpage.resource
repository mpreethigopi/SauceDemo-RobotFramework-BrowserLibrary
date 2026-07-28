*** Settings ***
Library    Browser

*** Variables ***
${username}    xpath=//*[@id='user-name']
${password}    xpath=//*[@id='password']
${login}       xpath=//*[@id='login-button']


*** Keywords ***
Hello
    Log To Console    Hello

Enter Username
    Fill Text    ${username}    standard_user

Enter Password
    Fill Text    ${password}    secret_sauce

Click on Signin
    Click    ${login}

Login into Application
    Enter Username
    Enter Password
    Click on Signin