*** Settings ***
Documentation       UAT-Lab11-002: การขอใบเสนอราคาผลิตภัณฑ์สำหรับรถยนต์ไม่สำเร็จ
...                  เนื่องจากกรอกข้อมูลไม่ถูกต้องหรือไม่สมบูรณ์
...                  Project ID: WEB-Lab-11 | UAT Name: เว็บไซต์ Tricentis Vehicle Insurance Application
...                  Pre-requisite: ไม่มี
Resource             ../resources/locators.robot
Resource             ../resources/keywords.robot
Suite Setup          Open Insurance Main Page
Suite Teardown       Close Insurance Website
Test Tags            uat-lab11-002    negative    automobile


*** Variables ***
${BROWSER}    chrome
${DELAY}      0


*** Test Cases ***
TC1 - Open Insurance Main Page
    [Documentation]    Expected: แสดงหน้า index.php ของ Tricentis Vehicle Insurance Application บน Chrome browser
    Page Should Contain    Tricentis Vehicle Insurance Application
    Go To Automobile Quote Form

TC2 - Enter InvalidVehicle Data for Automobile
    [Documentation]    กรอกข้อมูลรถทุกช่องเป็นค่าว่าง แล้วกดปุ่ม Next
    ...    Expected: แสดงหน้า app.php พร้อมกับข้อความเตือน "This field is required."
    ...    และไม่สามารถไปยังหน้า Enter Insurant Data ได้
    Click Element    ${BTN_NEXT_VEHICLE}
    Page Should Contain    ${TEXT_REQUIRED_FIELD}
    Page Should Not Contain    ${TEXT_ENTER_INSURANT_DATA}

TC3 - Enter Incomplete Insurance Data
    [Documentation]    กรอกข้อมูลผู้เอาประกันทุกช่องเป็นค่าว่าง แล้วกดปุ่ม Next
    ...    Expected: แสดงหน้า app.php พร้อมกับข้อความเตือน "This field is required."
    ...    และไม่สามารถไปยังหน้า Enter Product Data ได้
    [Setup]    Enter Vehicle Data
    ...    make=BMW
    ...    engine_performance=110
    ...    date_of_manufacture=09/09/2020
    ...    number_of_seats=5
    ...    fuel_type=Electric Power
    ...    list_price=30000
    ...    license_plate_number=CKK1234
    ...    annual_mileage=10000
    Wait Until Page Contains    ${TEXT_ENTER_INSURANT_DATA}    timeout=10s
    Click Element    ${BTN_NEXT_INSURANT}
    Page Should Contain    ${TEXT_REQUIRED_FIELD}
    Page Should Not Contain    ${TEXT_ENTER_PRODUCT_DATA}

TC4 - Enter Incomplete Product Data
    [Documentation]    กรอกข้อมูลรูปแบบประกันทุกช่องเป็นค่าว่าง แล้วกดปุ่ม Next
    ...    Expected: แสดงหน้า app.php พร้อมกับข้อความเตือน "This field is required."
    ...    และไม่สามารถไปยังหน้า Select Price Option ได้
    [Setup]    Enter Insurant Data
    ...    first_name=Wichai
    ...    last_name=Sandee
    ...    date_of_birth=01/31/1990
    ...    gender=Male
    ...    street_address=KKU
    ...    country=Thailand
    ...    zip_code=40002
    ...    city=Khon Kaen
    ...    occupation=Employee
    ...    hobbies=Other
    Wait Until Page Contains    ${TEXT_ENTER_PRODUCT_DATA}    timeout=10s
    Click Element    ${BTN_NEXT_PRODUCT}
    Page Should Contain    ${TEXT_REQUIRED_FIELD}
    Page Should Not Contain    ${TEXT_SELECT_PRICE_OPTION}
