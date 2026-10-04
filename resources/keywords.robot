*** Settings ***
Library     SeleniumLibrary
Resource    locators.robot


*** Keywords ***
Open Insurance Main Page
    [Documentation]    Test Case 1: เปิด Chrome browser แล้วกรอก URL เป็น http://sampleapp.tricentis.com/
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Page Should Contain    Tricentis Vehicle Insurance Application

Go To Automobile Quote Form
    Click Element    ${MENU_AUTOMOBILE}
    Wait Until Page Contains    Enter Vehicle Data    timeout=10s

Enter Vehicle Data
    [Documentation]    Test Case 2: กรอกข้อมูลรถสำหรับ Automobile
    [Arguments]    ${make}=${EMPTY}    ${engine_performance}=${EMPTY}    ${date_of_manufacture}=${EMPTY}
    ...    ${number_of_seats}=${EMPTY}    ${fuel_type}=${EMPTY}    ${list_price}=${EMPTY}
    ...    ${license_plate_number}=${EMPTY}    ${annual_mileage}=${EMPTY}
    Run Keyword If    '${make}' != '${EMPTY}'    Select From List By Label    ${FIELD_MAKE}    ${make}
    Run Keyword If    '${engine_performance}' != '${EMPTY}'
    ...    Input Text    ${FIELD_ENGINE_PERFORMANCE}    ${engine_performance}
    Run Keyword If    '${date_of_manufacture}' != '${EMPTY}'
    ...    Input Text    ${FIELD_DATE_OF_MANUFACTURE}    ${date_of_manufacture}
    Run Keyword If    '${number_of_seats}' != '${EMPTY}'
    ...    Input Text    ${FIELD_NUMBER_OF_SEATS}    ${number_of_seats}
    Run Keyword If    '${fuel_type}' != '${EMPTY}'    Select From List By Label    ${FIELD_FUEL_TYPE}    ${fuel_type}
    Run Keyword If    '${list_price}' != '${EMPTY}'    Input Text    ${FIELD_LIST_PRICE}    ${list_price}
    Run Keyword If    '${license_plate_number}' != '${EMPTY}'
    ...    Input Text    ${FIELD_LICENSE_PLATE_NUMBER}    ${license_plate_number}
    Run Keyword If    '${annual_mileage}' != '${EMPTY}'
    ...    Input Text    ${FIELD_ANNUAL_MILEAGE}    ${annual_mileage}
    Click Element    ${BTN_NEXT_VEHICLE}

Enter Insurant Data
    [Documentation]    Test Case 3: กรอกข้อมูลผู้เอาประกัน
    [Arguments]    ${first_name}=${EMPTY}    ${last_name}=${EMPTY}    ${date_of_birth}=${EMPTY}
    ...    ${gender}=${EMPTY}    ${street_address}=${EMPTY}    ${country}=${EMPTY}
    ...    ${zip_code}=${EMPTY}    ${city}=${EMPTY}    ${occupation}=${EMPTY}    ${hobbies}=${EMPTY}
    Run Keyword If    '${first_name}' != '${EMPTY}'    Input Text    ${FIELD_FIRST_NAME}    ${first_name}
    Run Keyword If    '${last_name}' != '${EMPTY}'    Input Text    ${FIELD_LAST_NAME}    ${last_name}
    Run Keyword If    '${date_of_birth}' != '${EMPTY}'    Input Text    ${FIELD_DATE_OF_BIRTH}    ${date_of_birth}
    Run Keyword If    '${gender}' == 'Male'    Select Radio Button    gender    male
    Run Keyword If    '${gender}' == 'Female'    Select Radio Button    gender    female
    Run Keyword If    '${street_address}' != '${EMPTY}'
    ...    Input Text    ${FIELD_STREET_ADDRESS}    ${street_address}
    Run Keyword If    '${country}' != '${EMPTY}'    Select From List By Label    ${FIELD_COUNTRY}    ${country}
    Run Keyword If    '${zip_code}' != '${EMPTY}'    Input Text    ${FIELD_ZIP_CODE}    ${zip_code}
    Run Keyword If    '${city}' != '${EMPTY}'    Input Text    ${FIELD_CITY}    ${city}
    Run Keyword If    '${occupation}' != '${EMPTY}'
    ...    Select From List By Label    ${FIELD_OCCUPATION}    ${occupation}
    Run Keyword If    '${hobbies}' != '${EMPTY}'    Select From List By Label    ${FIELD_HOBBIES}    ${hobbies}
    Click Element    ${BTN_NEXT_INSURANT}

Enter Product Data
    [Documentation]    Test Case 4: กรอกข้อมูลรูปแบบประกันที่ต้องการ
    [Arguments]    ${start_date}=${EMPTY}    ${insurance_sum}=${EMPTY}    ${merit_rating}=${EMPTY}
    ...    ${damage_insurance}=${EMPTY}    ${euro_protection}=${TRUE}    ${courtesy_car}=${EMPTY}
    Run Keyword If    '${start_date}' != '${EMPTY}'    Input Text    ${FIELD_START_DATE}    ${start_date}
    Run Keyword If    '${insurance_sum}' != '${EMPTY}'
    ...    Select From List By Label    ${FIELD_INSURANCE_SUM}    ${insurance_sum}
    Run Keyword If    '${merit_rating}' != '${EMPTY}'
    ...    Select From List By Label    ${FIELD_MERIT_RATING}    ${merit_rating}
    Run Keyword If    '${damage_insurance}' != '${EMPTY}'
    ...    Select From List By Label    ${FIELD_DAMAGE_INSURANCE}    ${damage_insurance}
    Run Keyword If    ${euro_protection} == ${TRUE}    Select Checkbox    ${CHECK_EURO_PROTECTION}
    Run Keyword If    '${courtesy_car}' == 'Yes'    Select Radio Button    courtesyCar    yes
    Click Element    ${BTN_NEXT_PRODUCT}

Select Price Option
    [Documentation]    Test Case 5: เลือกประกันภัยตามราคา (Silver)
    [Arguments]    ${option}=Silver
    Click Element    xpath=//*[@id='selectedPriceOption' and @value='${option}'] | //label[contains(.,'${option}')]//input
    Click Element    ${BTN_NEXT_PRICE}

Send Quote
    [Documentation]    Test Case 6: กรอกข้อมูลและส่งอีเมลเพื่อขอใบเสนอราคา
    [Arguments]    ${email}=${EMPTY}    ${phone}=${EMPTY}    ${username}=${EMPTY}
    ...    ${password}=${EMPTY}    ${confirm_password}=${EMPTY}    ${comment}=${EMPTY}
    Run Keyword If    '${email}' != '${EMPTY}'    Input Text    ${FIELD_EMAIL}    ${email}
    Run Keyword If    '${phone}' != '${EMPTY}'    Input Text    ${FIELD_PHONE}    ${phone}
    Run Keyword If    '${username}' != '${EMPTY}'    Input Text    ${FIELD_USERNAME}    ${username}
    Run Keyword If    '${password}' != '${EMPTY}'    Input Text    ${FIELD_PASSWORD}    ${password}
    Run Keyword If    '${confirm_password}' != '${EMPTY}'
    ...    Input Text    ${FIELD_CONFIRM_PASSWORD}    ${confirm_password}
    Run Keyword If    '${comment}' != '${EMPTY}'    Input Text    ${FIELD_COMMENT}    ${comment}
    Click Element    ${BTN_SEND}

Close Insurance Website
    [Documentation]    ปิดเว็บไซต์
    Close Browser
