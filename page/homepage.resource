*** Settings ***
Library    Browser

*** Variables ***
${home_page}        xpath=//*[@class='app_logo']

*** Keywords ***
Verify the homepage loaded
    Wait For Load State    networkidle
    Wait For Elements State    ${home_page}    visible    50s
    