**Settings**
Library     SeleniumLibrary
Variables   ../Pageobjects/element.py
Resource    ../Keywords/Keywords.robot

**Variables**
${registerPatient}  

**Test Cases**
Open browser
    [Documentation]   Here we are checking login functionality and check whether the page is 
    ...               loaded or not

    login
    Wait Until Page Contains Element    ${resisterpatient_id}   error=page not loaded
    Page Should Contain Element   ${resisterpatient_id}     message=Page doest not contain Resiter patient option   loglevel=TRACE
Register a new patient 
    [Documentation]  In this test case we are verifying the functionality of add a new patient
    Register new patient
Verify patient datials
    [Documentation]  In this test case, we are verifying that the data provided while creating a new patient matches the data displayed on the confirmation page or not.
    Verify patient details
Verify patient age
    Verify age
Confirm visit
    Confirm visit
Calculae and Verify BMI
    Check BMI
Check BMI details on Patient detail page
    Check BMI details
Recent Visit has one more new entry
    Recent Visit has one more new entry
Merge Visits
    Merge Visits
Check future date
    Add past date
Delete Patient
    Delete Patient

