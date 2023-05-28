#login page web elements
username_id = "id:username"
password_id = "id:password"
op_id = "id:Outpatient Clinic"
login_id = "id:loginButton"

#home page
resisterpatient_id = "id:referenceapplication-registrationapp-registerPatient-homepageLink-referenceapplication-registrationapp-registerPatient-homepageLink-extension"

#register a patient
givenname_id = "xpath://*[@name='givenName']"
middlename_id = "id:fr6109-field"
familyname_id = "xpath://*[@name='familyName']"
gender_id = "id:gender-field"
day_id = "id:birthdateDay-field"
month_id = "id:birthdateMonth-field"
year_id = "id:birthdateYear-field"
addreelin1_id = "id:address1"
addressline2_id = "id:address2"
city_id = "id:cityVillage"
state_id = "id:stateProvince"
country_id = "id:country"
zipcode_id = "id:postalCode"
phonenumber_id = "xpath://*[@name='phoneNumber']"
relationshiptype_id = "id:relationship_type"
personname_xpath = "xpath://*[@class='person-typeahead ng-pristine ng-untouched ng-valid ng-empty']"
relativenext_id = "id:next-button"

#verify patient details
name_xpath = "xpath://*[@id='dataCanvas']/div/p[1]"
gender_xpath = "xpath://*[@id='dataCanvas']/div/p[2]"
dob_xpath = "xpath://*[@id='dataCanvas']/div/p[3]"
address_xpath = "//*[@id='dataCanvas']/div/p[4]"
phnumber_xpath = "//*[@id='dataCanvas']/div/p[5]"
relatives_xpath = "//*[@id='dataCanvas']/div/p[6]"
submit_id = "id:submit"
age_xpath = "xpath://*[@id='content']/div[6]/div[1]/div/div[2]/span[2]"

#boook appointment
startvisit_xpath = "xpath://*[@id='org.openmrs.module.coreapps.createVisit']/div/div[2]"
confirmpopup_id = "id:quick-visit-creation-dialog"
confirmvisit_id = "id:start-visit-with-visittype-confirm"
attachmentbutton_id = "xpath://*[@id='attachments.attachments.visitActions.default']"
attchmentdropzone_id = "xpath:/html/body/div/div[3]/div[3]/div[1]/att-file-upload/div[3]/div/div[1]/form"
caption_xpath = "xpath://*[@ng-model='typedText.fileCaption']"
uploadfile_xpath = "xpath://*[@class='confirm ng-binding']"
gotopatientdetails_xpath = "xpath://ul[@id='breadcrumbs']//li[2]"

vists_date_xpath = "xpath://*[@ng-repeat='visit in $ctrl.visits track by $index']//a"
visits_vitals_xpath = "xpath://*[@ng-repeat='visit in $ctrl.visits track by $index']//div"
endvisit_xpath = "xpath://ul[@class='float-left d-none d-lg-block']//li[1]"
yesbutton_xpath = "xpath://*[@id='end-visit-dialog']//div[2]//button[1]"

#calculate BMI
cpaturevitals_xpath = "xpath://*[@id='referenceapplication.realTime.vitals']"
height_xpath = "xpath://*[@id='w8']"
weight_xpath = "xpath://*[@id='w10']"
calculatedbmi_xpath = "xpath://*[@id='calculated-bmi']"
savebmi_confirm_xpath = "xpath://*[@id='formBreadcrumb']/li[2]/span"
savebutton_xpath = "xpath://*[@id='confirmationQuestion']/p[1]/button"
#end_visit_xpath = "xpath://*[@id='visit-details']/div[2]/a[1]"

#patient detail-BMI details
bmi_height_xpath = "xpath://*[@id='height']/span[1]"
bmi_weight_xpath = "xpath://*[@id='weight']/span[1]"
bmi_calculatedbmi_xpath = "xpath://*[@id='calculated-bmi']"

#merge visits
mergevisit_xpath = "xpath://*[@id='org.openmrs.module.coreapps.mergeVisits']/div/div[2]"
merge_id = "id:mergeVisitsBtn"

#Future date validation
pastdate_xpath = "xpath://*[@id='org.openmrs.module.coreapps.createRetrospectiveVisit']/div/div[2]"
futuredate_xpath = "xpath://body[1]/div[2]/div[3]/table[1]/tbody[1]/tr[5]/td[3]"
futuredate_cssclass_xpath = "xpath://body[1]/div[2]/div[3]/table[1]/tbody[1]/tr[5]/td[3]//@class"

#Delete patient
patientid_xpath = "xpath://*[@id='content']/div[6]/div[2]/div/span"
deletepatient_xpath = "xpath://div[contains(text(),'Delete Patient')]"
reason_xpath = "xpath://input[@id='delete-reason']"
confirm_xpath = "xpath://div[@id='delete-patient-creation-dialog']//button[@class='confirm right'][normalize-space()='Confirm']"
toast_xpath = "xpath://*[contains(@class, 'toast')]"
search_xpath = "xpath://input[@id='patient-search']"
tablecontent_xpath = "xpath://table[@id='patient-search-results-table']//tbody"