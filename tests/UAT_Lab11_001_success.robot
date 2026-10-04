*** Settings ***
Documentation       UAT-Lab11-001: การขอใบเสนอราคาผลิตภัณฑ์สำหรับรถยนต์ได้สำเร็จ
...                  Project ID: WEB-Lab-11 | UAT Name: เว็บไซต์ Tricentis Vehicle Insurance Application
...                  Pre-requisite: ไม่มี
Resource             ../resources/locators.robot
Resource             ../resources/keywords.robot
Suite Setup          Open Insurance Main Page
Suite Teardown       Close Insurance Website
Test Tags            uat-lab11-001    positive    automobile


*** Variables ***
${BROWSER}    chrome
${DELAY}      0


*** Test Cases ***
TC1 - Open Insurance Main Page
    [Documentation]    Expected: แสดงหน้า index.php ของ Tricentis Vehicle Insurance Application บน Chrome browser
    Page Should Contain    Tricentis Vehicle Insurance Application
    Go To Automobile Quote Form

TC2 - Enter Vehicle Data for Automobile
    [Documentation]    Expected: แสดงหน้า app.php และมีข้อความ Enter Insurant Data ปรากฏในหน้านั้น
    Enter Vehicle Data
    ...    make=BMW
    ...    engine_performance=110
    ...    date_of_manufacture=09/09/2020
    ...    number_of_seats=5
    ...    fuel_type=Electric Power
    ...    list_price=30000
    ...    license_plate_number=CKK1234
    ...    annual_mileage=10000
    Wait Until Page Contains    ${TEXT_ENTER_INSURANT_DATA}    timeout=10s

TC3 - Enter Insurant Data
    [Documentation]    Expected: แสดงหน้า app.php และมีข้อความ Enter Product Data ปรากฏในหน้านั้น
    Enter Insurant Data
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

TC4 - Enter Product Data
    [Documentation]    Expected: แสดงหน้า app.php และมีข้อความ Select Price Option และ Silver ปรากฏในหน้านั้น
    Enter Product Data
    ...    start_date=10/1/2026
    ...    insurance_sum=7.000.000,00
    ...    merit_rating=Bonus 1
    ...    damage_insurance=No Coverage
    ...    euro_protection=${TRUE}
    ...    courtesy_car=Yes
    Wait Until Page Contains    ${TEXT_SELECT_PRICE_OPTION}    timeout=10s
    Page Should Contain    Silver

TC5 - Select Price Option
    [Documentation]    Expected: แสดงหน้า app.php และมีข้อความ Send Quote ปรากฏในหน้านั้น
    Select Price Option    option=Silver
    Wait Until Page Contains    ${TEXT_SEND_QUOTE}    timeout=10s

TC6 - Send Quote
    [Documentation]    Expected: แสดงหน้า app.php และมีข้อความ Sending e-mail success! ปรากฏในหน้านั้น
    Send Quote
    ...    email=wichai.sandee@gmail.com
    ...    phone=0049201123456
    ...    username=wichai.sandee
    ...    password=SecretPassword123!
    ...    confirm_password=SecretPassword123!
    ...    comment=Please contact via email only
    Wait Until Page Contains    ${TEXT_SUCCESS}    timeout=10s
