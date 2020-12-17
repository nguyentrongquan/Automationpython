*** Settings ***
Library           SeleniumLibrary
Library   SeleniumLibrary
*** Variables ***
${urlsite}        https://kiotviet.vn/
${browser}        chrome
${dashboardtitle}    KiotViet - Phần mềm quản lý bán hàng Phổ Biến Nhất
${usernameshop}    taphoakhoa154
${username}       0972641413
${password}       anhquan1994
${mykiottitle}    Dashboard

*** Test Cases ***
loginTest
    open kiotvietPage
    check title
    click dang nhap
    nhap gian hang
    click vao gian hang
    nhap username
    nhap password
    click buttonquanly
    click close popup
    click thiet lap cua hang
    click vao web ban hang
    vao trang quan tri
    check mykiot
    close browser
*** Keywords ***
open kiotvietPage
    open browser    ${urlsite}    ${browser}
    maximize Browser Window
    Set Selenium Implicit Wait    30

click dang nhap
    click element    xpath=//a[contains(text(),'Đăng Nhập')]

nhap gian hang
    input text    xpath=//input[@id='kvs']    ${usernameshop}

click vao gian hang
    click element    xpath=//input[@class='step-login kv-login']

nhap username
    input text    xpath=//input[@id='UserName']    ${username}

nhap password
    input text    xpath=//input[@id='Password']    ${password}

click buttonquanly
    click element    xpath=//input[@name='quan-ly']

Check Title
    Title Should be    ${dashboardtitle}
click close popup
    Wait Until Element Is Visible    xpath=//a[@class='popup-close']    20s
    click element    xpath=//a[@class='popup-close']

click thiet lap cua hang
    Mouse Over    xpath=//span[contains(text(),'Thiết lập')]
    Mouse Over    xpath=//a[contains(text(),'Thiết lập cửa hàng')]
    Click Element    xpath=//a[contains(text(),'Thiết lập cửa hàng')]

click vao web ban hang
    Click Element    xpath=//span[contains(text(),'Web bán hàng')]

vao trang quan tri
    Select Frame    xpath=//div[@id='block-ecatalog']//iframe
    Click Element    xpath=//button[text()='Vào trang quản trị']
    Unselect Frame
    sleep  3s
    select window  title=Dashboard
click tieptuc
    Click element    xpath=//button[@id='redirect-to-admin']

check mykiot
    Title Should Be    ${mykiottitle}
