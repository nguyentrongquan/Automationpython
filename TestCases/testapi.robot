*** Settings ***
Library           String
Library           Dialogs
Library           ExcelLibrary
Library           openpyxl
Library  ExcelLibrary
Library  SeleniumLibrary
Library  String

*** Variables ***
${INDEX}          0
${i}              0
@{valueslist}     Listvalue 0    Listvalue 1    Listvalue 2

*** Keywords ***
Excel Values Main Loop
    : FOR    ${INDEX}    IN RANGE    3    6
    \    Set Suite Variable    ${INDEX}
    \    ${i}    Evaluate    ${i}+1
    \    Log    INDEX value logged in (Excel Values Main Loop) is currently: ${INDEX}
    \    Put String To Cell    Listvalues    0    ${INDEX+1}    @{valueslist}[${i-1}]

Excel Values Inner Loop
    : FOR    ${i}    IN RANGE    0    3
    \    Log    Value of i logged in (Excel Values Inner Loop) is currently: ${i}
    \    Log    Listvalue logged in (Excel Values Inner Loop) is currently: @{valueslist}[${i}]
    \    Put String To Cell    Listvalues    0    ${INDEX+1}    @{valueslist}[${i}]
    Set Suite Variable    ${i}

Excel Values Dialog
    Pause Execution    Please press OK to write values to Excel rows

*** Test Cases ***
Excel Values
    [Documentation]    This is expected to write Listvalue 0, Listvalue 1 and Listvalue 2 (only one value per row) from variable @{valueslist} to Excel-rows 5, 6 and 7.
    ...
    open excel document  xcel    C:\\Users\\quannt\\PycharmProjects\\Automationpython\\test-excel.xlsx
    Excel Values Main Loop
    Pause Execution    Press OK to save next set of values to Excel
    save excel document    data3.xlsx
