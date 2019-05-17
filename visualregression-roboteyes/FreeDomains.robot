*** Settings ***
Library  SeleniumLibrary
#Resource  common/CK_FE.txt
Library  DebugLibrary

Library  RobotEyes  baseline  0.01
#Library  RobotEyes  test  0.05

Test Teardown  Close All Browsers

*** Variables ***
@{blur}  id=client-audit-apply-filter  css=.form-control
@{blur_1}  css=.filter-from > input:nth-child(1)  css=.filter-to > input:nth-child(1)

*** Test Cases ***
1. Default state Free Domains Page
  [Tags]  1
  Open Browser    https://10.30.3.52/detect-server/    chrome
  Maximize Browser Window
  Try to login
  # If using Webautomation
#  I am logged in as an admin
  # Opening Robot eyes tool
  Open Eyes  SeleniumLibrary
  # Debugging
#  Debug
  Capture banner
  Capture side bar menu
  # Graphs segment component
  Capture Graphs container
  # Title text Free domains report
  Capture page title
  # Title text description
  Capture title text description

2. Client Audit Report default state
  [Tags]  2
  Open Browser    https://10.30.3.52/detect-server/    chrome
  Maximize Browser Window
  Try to login
  Navigate to Client Audit Report
  Open Eyes  SeleniumLibrary
  sleep  2s
  capture full screen  tolerance=10  blur=${blur_1}
  compare images

3. Client Audit Report new email directions
  [Tags]  3
  Open Browser    https://10.30.3.52/detect-server/    chrome
  Maximize Browser Window
  Try to login
  Navigate to Client Audit Report
  Open Eyes  SeleniumLibrary
  Select Date range for New email direction emails

  Recipient addressed per day graph is shown
  capture full screen
  Compare Images


*** Keywords ***
Try to login
  input text  name=email  protectdev1@gmail.com
  input password  name=password  Workshare1!
  click element  id=login

Capture banner
  Wait and capture element  css=.css-1dxnxui

Capture side bar menu
  Wait and capture element  id=main-menu

Capture Graphs container
  Wait and capture element  css=.eleven.wide.computer.sixteen.wide.tablet.column

Capture page title
  Wait and capture element  id=view-title

Capture title text description
  Wait and capture element  css=.css-yluk59

Wait and capture element  [Arguments]  ${locator}
  Wait Until Element Is Visible  ${locator}  10s
  capture element  ${locator}

Navigate to Client Audit Report
  Wait Until Element Is Visible  id=menu-option-client-audit
  Click Element  id=menu-option-client-audit
  wait until keyword succeeds  10s  1s  Location Should Contain  client-audit

Select Date range for New email direction emails
  Wait Until Element Is Visible  name=startDate
  sleep  1s
  clear element text  name=startDate
  Input Text  name=startDate  2015-01-01

  Wait Until Element Is Visible  name=endDate
  sleep  1s
  clear element text  name=endDate
  Input Text  name=endDate  2015-01-07

  Wait Until Element Is Visible  id=client-audit-apply-filter
  Click Element  id=client-audit-apply-filter

Recipient addressed per day graph is shown
#  Wait and capture element  css=.recharts-surface
  Wait and capture element  id=client-audit-recipients-per-day-chart
#  Debug
