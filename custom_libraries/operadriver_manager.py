from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.opera import OperaDriverManager
from lib2to3.tests.support import driver
import os
from os.path import curdir




def get_operadriver_path():
    ReturnPath = os.getcwd()
    driver_path = OperaDriverManager(path=ReturnPath).install()
    print(driver_path)
    return driver_path