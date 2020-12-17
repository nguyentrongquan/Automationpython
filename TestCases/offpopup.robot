*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${url}            https://admin-prelive.citigo.dev:40003/connect?client_id=792b3704-0c9e-4462-a5ea-d4a5c400a7b5&secret_key=84712B6BF6F39E80E7628BC3A8ECCE870082582C&retailer_code=quannt&retailer_id=785673
${browsername}    chrome

*** Test Cases ***
OffPopup
    [Tags]    off
    open browser    ${url}    ${browsername}
    maximize browser window
    sleep    5s
    ${Status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[contains(@class,'swiper-container-horizontal')]
    Run Keyword If    '${Status}'=='True'    click popup
    ...    ELSE    no popup

*** Keywords ***
click popup
    Click Element    xpath=//div[@class='x-close']
    log to console    xuat hien popup
    close browser

no popup
    log to console   chua co popup
    close browser
