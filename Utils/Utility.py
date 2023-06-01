from datetime import date
import datetime
from selenium import webdriver
 
def calculate_age(day, month, year):
    today = date.today()
    birthdate = date(year, month, day)
    age = today.year - birthdate.year - ((today.month, today.day) < (birthdate.month, birthdate.day))
    calculatedage = str(age)
    return calculatedage

def verify_date(date1):
    date2 = date1.rstrip(" Vitals")
    var = datetime.datetime.strptime(date2, '%d.%b.%Y').strftime('%Y-%m-%d')
    var2 = str(date.today())
    result = var == var2
    return str(result)

def bmi(height, weight):
    height_m = height / 100
    bmi = weight / (height_m ** 2)
    roundedBmi = round(bmi,1)
    return str(roundedBmi)

def current_date():
    return str(date.today().strftime('%d.%b.%Y'))
