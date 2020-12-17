*** Settings ***
Library           ExcelLibrary
Library           Collections

*** Test Cases ***
Simple
    Create Excel Document    doc_id=docname1
    Write Excel Cell    1    1    test excel
    Save Excel Document    filename=file.xlsx
    Close All Excel Documents
