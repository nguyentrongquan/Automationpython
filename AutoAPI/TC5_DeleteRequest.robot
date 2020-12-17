*** Settings ***
Library   RequestsLibrary
Library   JSONLibrary
Library   Collections
*** Variables ***
${Base_URL}  http://thetestingworldapi.com/


*** Test Cases ***
TC_004 create new resource
    create session   AddData  ${base_url}
    $
    delete request
