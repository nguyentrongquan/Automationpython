*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/LoginKeywords.robot
*** Variables ***
${browser}  chrome
${url}  https://kiotviet.vn/
${username}   0888806836
${password}  anhquan1994
${nameshop}  sieuthiminik154
*** Test Cases ***
Login Test
    open my browser   ${url}   ${browser}
    Enter Name Shop   ${nameshop}
    Enter UserName and PassWord  ${username}  ${password}
    close browser

