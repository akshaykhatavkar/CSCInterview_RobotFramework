*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Open Github
    open browser    https://github.com/     chrome
    maximize browser window

Search Repo
    [Arguments]    ${search_Text}
    ${xp}   set variable    //input[@name='q']
    wait until element is visible    ${xp}  30s
    input text    ${xp}     ${search_Text}
    press keys    ${xp}     RETURN

Click on Advanced Search
    ${xp}   set variable    //a[text()='Advanced search']
    wait until element is visible    ${xp}  30s
    click element    ${xp}

Select Language
     [Arguments]    ${language}
    ${xp}   set variable    //select[@id="search_language"]
    wait until element is visible    ${xp}  30s
    select from list by label    ${xp}  ${language}

Select State
     [Arguments]    ${state}
    ${xp}   set variable    //select[@id="search_state"]
    wait until element is visible    ${xp}  30s
    select from list by label    ${xp}  ${state}

Enter Followers
     [Arguments]    ${followers}
    ${xp}   set variable    //input[@id="search_followers"]
    wait until element is visible    ${xp}  30s
    input text    ${xp}     ${followers}

Enter Stars
     [Arguments]    ${stars}
    ${xp}   set variable    //input[@id="search_stars"]
    wait until element is visible    ${xp}  30s
    input text    ${xp}     ${stars}

Select License
     [Arguments]    ${license}
    ${xp}   set variable    //select[@id="search_license"]
    wait until element is visible    ${xp}  30s
    select from list by label    ${xp}  ${license}

Search on Advanced Search Page
    ${xp}   set variable    //button[@type='submit']
    wait until element is visible    ${xp}  30s
    click element    ${xp}
    sleep    3s

Get Total Repos under Search Result Page
     [Return]    ${total_repos}
    ${xp}   set variable    //a[@class='v-align-middle']
    wait until element is visible    ${xp}  30s
    ${total_repos}  get element count    ${xp}

Get Repo Name at search location
    [Arguments]    ${location}
    [Return]    ${repo_name}
    ${xp}   set variable    //a[@class='v-align-middle']
    wait until element is visible    ${xp}  30s
    ${elements}     get webelements    ${xp}
    ${repo_name}    get text   ${elements[${location}]}

Navigate to specific Repo on Search Page
    [Arguments]    ${location}
    ${xp}   set variable    //a[@class='v-align-middle']
    wait until element is visible    ${xp}  30s
    ${elements}     get webelements    ${xp}
    click element    ${elements[${location}]}

Get number of Chars of ReadMe
    [Arguments]    ${no_of_chars}
    [Return]    ${intended_text}
    ${xp}   set variable    //div[@data-target="readme-toc.content"]
    wait until element is visible    ${xp}  30s
    ${text}     get text    ${xp}
    ${intended_text}    set variable    ${text[0:${no_of_chars}]}

Test_Teardown
    close all browsers