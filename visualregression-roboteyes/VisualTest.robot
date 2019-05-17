*** Settings ***
Library  Selenium2Library
Library  RobotEyes  baseline  0.01
#Library  RobotEyes  test  0.05

Test Teardown  Close All Browsers

*** Test Cases ***
1. Visual test
  Open Browser    https://www.google.com/    chrome
  Maximize Browser Window
  Wait Until Element Is Visible  css=.gLFyf.gsfi
  Click Element  css=.gLFyf.gsfi
  Input Text  css=.gLFyf.gsfi  example
  sleep  5s
  #Open Eyes    SeleniumLibrary  # Use the selenium library as the argument E.g. AppiumLibrary or SeleniumLibrary
  Open Eyes    # Use the selenium library as the argument E.g. AppiumLibrary or SeleniumLibrary
  #Wait Until Element Is Visible    id=lst-ib
  Wait Until Element Is Visible    id=hplogo
  Capture Full Screen
  Compare Images

2. visual test marca.com
  Open Browser    https://www.marca.com/    chrome
  Maximize Browser Window
  #Open Eyes    SeleniumLibrary  # Use the selenium library as the argument E.g. AppiumLibrary or SeleniumLibrary
  Open Eyes    # Use the selenium library as the argument E.g. AppiumLibrary or SeleniumLibrary
  #Wait Until Element Is Visible    id=lst-ib
  Wait Until Element Is Visible  css=.tools-header
  Capture Full Screen
  Compare Images
