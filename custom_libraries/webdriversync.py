from selenium import webdriver
from webdriver_manager.chrome import ChromeDriverManager
from webdriver_manager.firefox import GeckoDriverManager



def get_chromedriver_path():
    driver_path = ChromeDriverManager().install()
    print(driver_path)
    return  driver_path

def get_geckodriver_path():
    driver_path = GeckoDriverManager().install()
    print(driver_path)
    return  driver_path