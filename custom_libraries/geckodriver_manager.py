from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.firefox import GeckoDriverManager
from lib2to3.tests.support import driver
import os
from os.path import curdir




def get_geckodriver_path():
    ReturnPath = os.getcwd()
    driver_path = GeckoDriverManager(path=ReturnPath).install()
    print(driver_path)
    return driver_path

# from selenium import webdriver
# from selenium.webdriver.firefox.options import Options

# options = Options()
# options.headless = True
# driver = webdriver.Firefox(options=options, executable_path=r'C:\Utility\BrowserDrivers\geckodriver.exe')
# driver.get("http://google.com/")
# print ("Headless Firefox Initialized")
# driver.quit()