*** Settings ***
Library   Browser

*** Variables ***
${BROWSER}  chromium

*** Keywords ***
Open Smashfinland
    Register Keyword To Run On Failure  Test Failed
    New Browser  browser=${BROWSER}  headless=${False}
    New Page    https://smashfinland.fi
    Wait For Elements State  id=frontpage-left-column

Test Failed
    Take Screenshot  EMBED