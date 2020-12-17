*** Settings ***
Library  RequestsLibrary

*** Variables ***
${App_Base_URL}  http://thetestingworldapi.com/
${studentID}  28

*** Test Cases ***
TC_001_Fetch_Student_details_by_id
    create session   FetchData  ${App_Base_URL}
    ${Response}=  get request  FetchData   api/studentsDetails/${studentID}
    ${actual_code}=  convert to string  ${Response.status_code}
    should be equal   ${actual_code}  200
