*** Settings ***
Resource  ../Resources/common.resource
Suite Setup  Open About Us
Suite Teardown  Close Browser

*** Test Cases ***
Association Rules Are Visible
    Wait For Elements State  text="Yhdistyksen säännöt"

Board Portraits Are Visible
    Wait For Elements State  css=#board .row:nth-child(2)
    Portraits Are Visible  \#board .row:nth-child(2)

Clerk Portraits Are Visible
    Wait For Elements State  css=#toimihenkilot
    Portraits Are Visible  \#toimihenkilot

Previous Board Can Be Opened
    ${previous_board_name}  Get Text  css=#otherBoards a
    Click  text="${previous_board_name}"
    Wait For Elements State  //h3[contains(text(),'${previous_board_name}')]

*** Keywords ***
Open About Us
    Open Smashfinland
    Click  text="TIETOA MEISTÄ"
    Wait For Elements State  id=about

Portraits Are Visible
    [Arguments]  ${root_css_selector}
    ${portraits}  Get Elements  css=${root_css_selector} .card-img-top
    FOR  ${portrait}  IN  @{PORTRAITS}
        Wait For Elements State  ${portrait}
    END