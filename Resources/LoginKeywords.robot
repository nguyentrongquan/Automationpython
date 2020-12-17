*** Settings ***
Library           SeleniumLibrary
Variables         ../PageObjects/Locators.py

*** Keywords ***
open my browser
    [Arguments]    ${url}    ${browser}
    open my browser    ${url}    ${browser}
    set browser implicit wait    30s
    maximize browser window

Enter Name Shop
    [Arguments]    ${nameshop}
    click element    ${btn_dangnhap}
    input text    ${txt_nameshop}    ${nameshop}
    click element    ${btn_vaocuahang}

Enter UserName and PassWord
    [Arguments]    ${username}    ${password}
    input text    ${txt_username}    ${username}
    input password    ${txt_password}    ${password}
    click element    ${btn_quanly}
