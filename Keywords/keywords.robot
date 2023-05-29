**Settings**
Library     SeleniumLibrary
Variables   ../Pageobjects/element.py
Library    String
Library     ../Utils/Utility.py
Library     DateTime


**Variables**
${url}  https://qa-refapp.openmrs.org/openmrs/login.htm
${browser}  chrome
${username}  Admin
${password}  Admin123
${firstname}    Prakash
${lastname}     Sundar
${gender}   M
${address}  123, main street, miami, florida, United States, 33101
${phone}    9876543210
${filepath}     F://Assessment/Resources/sampleFile.jpeg

**Keywords**
login
    Open Browser    ${url}     ${browser}
    Maximize Browser Window
    Set Selenium Speed  0.5 second
    input text  ${username_id}  ${username}
    input text  ${password_id}  ${password}
    Click Element   ${op_id}
    Click Element   ${login_id}
    Log    successfully logged in      level=INFO

Register new patient
    Set Selenium Speed  0.5 second
    click element   ${resisterpatient_id}
    Wait Until Element Is Visible  ${givenname_id}
    input text  ${givenname_id}     ${firstname}
    input text   ${familyname_id}    ${lastname}
    click element   ${relativenext_id}
    Select From List By Value   ${gender_id}    ${gender}
    click element   ${relativenext_id}
    input text  ${day_id}   31
    Select From List By Value   ${month_id}    5
    input text  ${year_id}  1997
    click element   ${relativenext_id}
    input text  ${addreelin1_id}   2711 S Ocean Dr
    input text  ${city_id}   Hollywood
    input text  ${state_id}   FL
    input text  ${country_id}   United States
    input text  ${zipcode_id}   33019
    click element   ${relativenext_id}
    input text  ${phonenumber_id}   ${phone}
    click element   ${relativenext_id}
    click element   ${relativenext_id}
    Log    New patient created      level=INFO
Verify patient details
#Verify name
    Set Selenium Speed  0.5 second
    ${temp}=    Get Text    ${name_xpath}
    ${x}=   Fetch From Right    ${temp}    Name: 
    ${xstripped}=   Strip String    ${x}    mode=left
    Should be equal   ${xstripped}    Prakash, Sundar
#------------------------------------------------------------------------
#verify Gender
    ${temp1}=    Get Text    ${gender_xpath}
    ${x1}=   Fetch From Right    ${temp1}    Gender: 
    ${x1stripped}=   Strip String    ${x1}    mode=left
    Should be equal   ${x1stripped}    Male
#------------------------------------------------------------------------
#Verify Date of birth
    ${temp2}=    Get Text    ${dob_xpath}
    ${x2}=   Fetch From Right    ${temp2}    Birthdate: 
    ${x2stripped}=   Strip String    ${x2}    mode=left
    Should be equal   ${x2stripped}    31, May, 1997
#------------------------------------------------------------------------
#Verify Address
    ${temp3}=    Get Text    ${address_xpath}
    ${x3}=   Fetch From Right    ${temp3}    Address: 
    ${x3stripped}=   Strip String    ${x3}    mode=left
    Should be equal   ${x3stripped}    2711 S Ocean Dr, Hollywood, FL, United States, 33019
#------------------------------------------------------------------------
#Verify Phonenumber
    ${temp4}=    Get Text    ${phnumber_xpath}
    ${x4}=   Fetch From Right    ${temp4}    Phone Number: 
    ${x4stripped}=   Strip String    ${x4}    mode=left
    Should be equal   ${x4stripped}    9876543210 
#------------------------------------------------------------------------
#Verify relatives
    ${temp5}=    Get Text    ${relatives_xpath}
    ${x5}=   Fetch From Right    ${temp5}    Relatives: 
    ${x5stripped}=   Strip String    ${x5}    mode=left
    Should be equal   ${x5stripped}    ---

Verify age
    Set Selenium Speed  0.5 second
    click element   ${submit_id}
    Wait Until Element Is Visible   ${age_xpath}  timeout=60 seconds
    ${tempAge}=    Get Text    ${age_xpath}
    ${age}=   Fetch From Left    ${tempAge}    year(s) ( 31.May.1997) 
    ${actualAge}=   Strip String    ${age}    mode=right
    #convert the give date value to YYYY-MM-DD format
    ${convertdate}=  Convert Date    19970531    result_format=%Y-%m-%d
    #call python function
    ${expectedAge}=     Calculate Age   ${31}   ${5}    ${1997}
    Should be Equal    ${actualAge}    ${expectedAge}

Confirm visit
    Set Selenium Speed  0.5 second
    click element   ${startvisit_xpath}
    #Switch Window   ${confirmpopup_id}
    click element   ${confirmvisit_id}
    Wait Until Element Is Visible   ${attachmentbutton_id}  timeout=60 seconds
#---------------Attachment Code start --------------------------------------------# 

    # click element   ${attachmentbutton_id}
    # Wait Until Element Is Visible   ${attchmentdropzone_id}     timeout=20 seconds
    # Choose File      ${attchmentdropzone_id}     /Assessment/Resources/sampleFile.jpeg
    # input text  ${caption_xpath}    Test Attachment
    # click element   ${uploadfile_xpath}
    # Wait until element is visible  //div[contains(@class, 'toast-item-close')]
    # ${message}=  Get text  //div[contains(@class, 'toast-item-close')]
    # #Should be equal  ${message}  Record submitted
    # Log to console  ${message}

#-------------Attachment code End-------------------------------------------#
#go back to patient details and check for recent visit
    click element   ${gotopatientdetails_xpath}
    Wait Until Element Is Visible   ${endvisit_xpath}     timeout=60 seconds
#Verfiy Recent Visit has one entry for current date    
    ${recentvisit}=   Get Text  ${vists_date_xpath}
    Should Not Be Empty     ${recentvisit}    msg=No vist recorded
    ${verifydate}=     Verify Date   ${recentvisit}
    Should be Equal    ${verifydate}    True
#click on end visit
    click element   ${endvisit_xpath}
    click element   ${yesbutton_xpath}
Check BMI
    Set Selenium Speed  0.5 seconds
    click element   ${startvisit_xpath}
    click element   ${confirmvisit_id}
    Wait Until Element Is Visible   ${cpaturevitals_xpath}  timeout=60 seconds
    click element      ${cpaturevitals_xpath}
    Wait Until Element Is Visible   ${height_xpath}  timeout=60 seconds
    input text      ${height_xpath}   175
    click element   ${relativenext_id}
    Wait Until Element Is Visible   ${weight_xpath}  timeout=60 seconds
    input text      ${weight_xpath}   80
    click element   ${relativenext_id}  
    #verify bmi-----------------------
    ${bmi}=     Bmi     ${175}     ${80}
    ${calculatedbmi}=   Get Text    ${calculatedbmi_xpath}
    Should be Equal    ${bmi}    ${calculatedbmi}
    #save changes--------------------
    click element   ${savebmi_confirm_xpath}
    Wait Until Element Is Visible   ${savebutton_xpath}  timeout=60 seconds
    click element   ${savebutton_xpath}
    Wait Until Element Is Visible   ${gotopatientdetails_xpath}  timeout=60 seconds
    click element   ${gotopatientdetails_xpath}
    click element   ${endvisit_xpath}
    click element   ${yesbutton_xpath}
Check BMI details
    Set Selenium Speed  0.5 seconds
    Wait Until Element Is Visible   ${bmi_height_xpath}  timeout=60 seconds
    ${getheight}=   Get Text    ${bmi_height_xpath}
    Should be Equal    ${getheight}    175
    ${getweight}=   Get Text    ${bmi_weight_xpath}
    Should be Equal    ${getweight}    80
    ${getbmi}=      Get Text    ${bmi_calculatedbmi_xpath}
    ${bmi}=     Bmi     ${175}     ${80}
    Should be Equal    ${getbmi}    ${bmi}
Recent Visit has one more new entry
    Set Selenium Speed  0.5 seconds
    ${visitdate}=   Get Text  ${vists_date_xpath}
    ${visitvitals}=     Get Text    ${visits_vitals_xpath}
    Log to console      ${visitdate}
    ${currentdate}=     Current Date
    Should Contain Any    ${visitdate}    ${currentdate}
    Should Contain Any    ${visitvitals}    Vitals
    ${verifydatefunction}=     Verify Date   ${visitdate}
    Should be Equal    ${verifydatefunction}    True
Merge Visits
    Set Selenium Speed  0.5 seconds
    Wait Until Element Is Visible   ${mergevisit_xpath}  timeout=60 seconds
    click element   ${mergevisit_xpath}
    Wait Until Element Is Visible   xpath://*[@id='active-visits']//tbody//tr[1]//td[1]//*[@type='checkbox']  timeout=60 seconds
    click element   xpath://*[@id='active-visits']//tbody//tr[1]//td[1]//*[@type='checkbox']
    click element   xpath://*[@id='active-visits']//tbody//tr[2]//td[1]//*[@type='checkbox']
    click element   ${merge_id}
    Wait Until Element Is Visible   ${gotopatientdetails_xpath}  timeout=60 seconds
    click element   ${gotopatientdetails_xpath}
    Wait Until Element Is Visible   ${vists_date_xpath}  timeout=60 seconds
    ${visit2}=   Get Text  ${vists_date_xpath}
    Log to console      ${visit2}
    ${currentdate}=     Current Date
    Should Contain Any    ${visit2}    ${currentdate}  Vitals
Add past date
    Set Selenium Speed  0.5 seconds
    click element   ${pastdate_xpath}
    #Wait Until Element Is Enabled   ${futuredate_xpath}  timeout=30 seconds
    # Mouse Over      ${futuredate_xpath}
    # Mouse Down   ${futuredate_xpath}
    # ${ele}    Get WebElement    //body[1]/div[2]/div[3]/table[1]/tbody[1]/tr[5]/td[3]
    # Execute Javascript    arguments[0].click();     ARGUMENTS    ${ele} 
    #Execute JavaScript    document.evaluate('${futuredate_xpath}',document.body,null,9,null).singleNodeValue.click();
    
    Element Attribute Value Should Be   ${futuredate_xpath}     class   day disabled
    
    #click element   ${futuredate_xpath}
    ${status}=    Run Keyword And Return Status    Click Element    ${futuredate_xpath}
    Run Keyword If    'False'=='${status}'    Fail    "Element should not be clickable"
    Press Keys      None    ESC
Delete Patient
    Set Selenium Speed  0.5 seconds
    ${patient_id}=  Get Text    ${patientid_xpath}
    Log to console  ${patient_id}
    click element   ${deletepatient_xpath}
    input text  ${reason_xpath}     Test
    click element       ${confirm_xpath}
    Element Should Contain  ${toast_xpath}  Patient has been deleted successfully

    #check deleted petient is removed from trhe patient list
    Wait Until Element Is Enabled   ${search_xpath}  timeout=30 seconds
    input text      ${search_xpath}     ${patient_id}
    Sleep   5s
    Element Should Contain      ${tablecontent_xpath}   No matching records found
#log files