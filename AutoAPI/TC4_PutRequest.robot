*** Settings ***
Library   RequestsLibrary
Library   JSONLibrary
Library   Collections
*** Variables ***
${Base_URL}  http://thetestingworldapi.com/


*** Test Cases ***
TC_004 create new resource
    create session   AddData  ${base_url}
    &{body}=  create dictionary  id=80107  first_name=Testing  middle_name=A   last_name=Auto  date_of_birth=12/12/1990
    &{header}=  create dictionary  Content-Type=application/json
    ${response}=  put request    AddData  api/studentsDetails/80107   data=${body}  headers=${header}
    log to console   ${response.status_code}
    log to console   ${response.content}

    ${response1}=  get request   AddData  api/studentsDetails/80107
    log to console   ${response1.content}

