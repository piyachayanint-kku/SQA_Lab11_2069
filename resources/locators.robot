*** Variables ***
# ---------------------------------------------------------------------------
# Locators for the Tricentis Sample Application (sampleapp.tricentis.com)
# NOTE: this is a public, community-maintained demo site. If the live DOM
# has drifted from these ids, open the page in DevTools (F12) and update the
# values below only -- the .robot test files never need to change.
# ---------------------------------------------------------------------------

${URL}                          http://sampleapp.tricentis.com/

# --- Main / navigation ---
${MENU_AUTOMOBILE}              xpath=//a[contains(@href,'app.php') and contains(.,'Automobile')]

# --- Step 1: Enter Vehicle Data ---
${FIELD_MAKE}                   id=make
${FIELD_ENGINE_PERFORMANCE}     id=enginePerformance
${FIELD_DATE_OF_MANUFACTURE}    id=dateOfManufacture
${FIELD_NUMBER_OF_SEATS}        id=numberOfSeats
${FIELD_FUEL_TYPE}              id=fuelType
${FIELD_LIST_PRICE}             id=listPrice
${FIELD_LICENSE_PLATE_NUMBER}   id=licensePlateNumber
${FIELD_ANNUAL_MILEAGE}         id=annualMileage
${BTN_NEXT_VEHICLE}             id=next1

# --- Step 2: Enter Insurant Data ---
${FIELD_FIRST_NAME}             id=firstName
${FIELD_LAST_NAME}              id=lastName
${FIELD_DATE_OF_BIRTH}          id=dateOfBirth
${RADIO_GENDER_MALE}            id=gender-male
${RADIO_GENDER_FEMALE}          id=gender-female
${FIELD_STREET_ADDRESS}         id=streetAddress
${FIELD_COUNTRY}                id=country
${FIELD_ZIP_CODE}               id=zipCode
${FIELD_CITY}                   id=city
${FIELD_OCCUPATION}             id=occupation
${FIELD_HOBBIES}                id=hobbies
${BTN_NEXT_INSURANT}            id=next2

# --- Step 3: Enter Product Data ---
${FIELD_START_DATE}             id=startDate
${FIELD_INSURANCE_SUM}          id=insuranceSum
${FIELD_MERIT_RATING}           id=meritRating
${FIELD_DAMAGE_INSURANCE}       id=damageInsurance
${CHECK_EURO_PROTECTION}        id=euroProtection
${FIELD_COURTESY_CAR}           id=courtesyCar
${BTN_NEXT_PRODUCT}             id=next3

# --- Step 4: Select Price Option ---
${RADIO_PRICE_SILVER}           id=selectedPriceOption
${BTN_NEXT_PRICE}               id=next4

# --- Step 5: Send Quote ---
${FIELD_EMAIL}                  id=eMail
${FIELD_PHONE}                  id=phone
${FIELD_USERNAME}                id=userName
${FIELD_PASSWORD}               id=password
${FIELD_CONFIRM_PASSWORD}       id=confirmPassword
${FIELD_COMMENT}                id=comment
${BTN_SEND}                     id=send

# --- Confirmation / validation messages ---
${TEXT_SUCCESS}                 Sending e-mail success!
${TEXT_ENTER_INSURANT_DATA}     Enter Insurant Data
${TEXT_ENTER_PRODUCT_DATA}      Enter Product Data
${TEXT_SELECT_PRICE_OPTION}     Select Price Option
${TEXT_SEND_QUOTE}              Send Quote
${TEXT_REQUIRED_FIELD}          This field is required.
