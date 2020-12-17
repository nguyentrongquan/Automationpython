*** Settings ***
Library  make_excel
*** Variables ***

*** Test Cases ***
Test
    Make Excel File   NewExcel.xlsx  1000
    Add Value  NewExcel.xlsx  A1  90