*** Settings ***
Resource    ../Resources/GitHub_App.robot
Test Teardown    Test_Teardown

*** Test Cases ***
Search for a closed Repo
    [Tags]    github
    Open Github
    Search Repo    react
    Click on Advanced Search
    Select Language    JavaScript
    Select State    closed
    Enter Stars    >45
    Enter Followers    >50
    Select License    Boost Software License 1.0
    Search on Advanced Search Page
    #Validate Total number of Repos
    ${total_repo}   get total repos under search result page
    should be equal as integers    ${total_repo}    1
    #Validate Repo Name
    ${repo_name}    get repo name at search location    0
    should be equal as strings    ${repo_name}  mvoloskov/decider
    #Get ReadMe Chars
    Navigate to specific Repo on Search Page    0
    ${readMe}   get number of chars of readme    300
    log to console  ${readMe}
    log    ${readMe}