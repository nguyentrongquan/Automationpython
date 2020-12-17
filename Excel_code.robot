*** Settings ***
Library           StringFormat
Library           BuiltIn
Library           ExcelLibrary
Library           SeleniumLibrary
Library           JSONLibrary
Library           RequestsLibrary
Library           String

*** Test Cases ***
excel test
    [Tags]    excel
    open Excel Document    data6.xlsx    sample
    Create Session    lolo    https://queue-staging.citigo.dev:40001
    ${resp1}=    RequestsLibrary.Get Request    lolo    /job/current_job
    Should Be Equal As Strings    ${resp1.status_code}    200
    Log    ${resp1.json()}
    ${get_raw_data}    Get Value From Json    ${resp1.json()}    $..data.webhook_queue
    ${result} =    Evaluate    ${get_raw_data}[0] if ${get_raw_data} else 0
    ${result} =    Evaluate    $result or 0
    log    ${result}
    Create Session    lolo    https://queue-staging.citigo.dev:40001
    ${resp1}=    RequestsLibrary.Get Request    lolo    /product/get-time-sync/2440156/259596
    Should Be Equal As Strings    ${resp1.status_code}    200
    Log    ${resp1.json()}
    ${get_update_at_kv}    Get Value From Json    ${resp1.json()}    $..data.updated_at_kv
    ${time_update_at_kv} =    Evaluate    $get_update_at_kv[0]
    ${get_receive}    Get Value From Json    ${resp1.json()}    $..data.receive
    ${time_recieve} =    Evaluate    $get_receive[0]
    ${get_updated_at}    Get Value From Json    ${resp1.json()}    $..data.updated_at
    ${time_get_update_at} =    Evaluate    $get_updated_at[0]
    ${item_cell}    set variable    0
    FOR    ${index}    IN RANGE    100
        ${item_cell}    Sum    ${item_cell}    1
        ${get_data_col}    Read excel cell    ${item_cell}    1
        ${data_col}    convert to string    ${get_data_col}
        log    ${data_col}
        Run keyword if    '${data_col}'=='${None}'    write excel    ${item_cell}    ${result}    ${time_update_at_kv}    ${time_recieve}    ${time_get_update_at}
    END
    save excel document    data6.xlsx

*** Keyword ***
Sum
    [Arguments]    ${num1}    ${num2}
    ${num1}    Convert To Number    ${num1}
    ${num2}    Convert To Number    ${num2}
    ${result_ns}    Create Dictionary    x=${num1}    y=${num2}
    ${result}    Evaluate    x+y    namespace=${result_ns}
    Return From Keyword    ${result}

write excel
    [Arguments]    ${item_cell}    ${result}    ${time_update_at_kv}    ${time_recieve}    ${time_updated_at}
    write excel cell    ${item_cell}    1    ${result}
    write excel cell    ${item_cell}    2    ${time_update_at_kv}
    write excel cell    ${item_cell}    3    ${time_recieve}
    write excel cell    ${item_cell}    4    ${time_updated_at}
    Exit For Loop
