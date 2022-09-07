*** Settings ***
Documentation       CMS-Engage360 Community Waterford

Library    SeleniumLibrary

Suite Setup        web setup
#Suite Teardown    Close All Browsers

Resource    Resources/Variables.resource
Resource    Resources/Keywords.resource

*** Test Cases ***

PR01 Automation to enter Community Waterford and not fill tab Title, Description
        [Tags]      Validation Test       Case 1

#1 Open Community Waterford
        Click Element    ${Community}
        Drag And Drop    ${Waterford}      ${Community}
        Click Element    ${Waterford}

# Simulate click Total Opened Window
        scroll element into view            ${Total_Opened}
        element should be visible           ${Total_Opened}      Total Opened
        mouse over                          ${Total_Opened}

#  Enter Dinning Window
        wait until element is visible        ${Dinning}
        scroll element into view            ${Dinning}
        click element                       ${Dinning}

# Click Community Waterford
        scroll element into view            ${Community}
        element should be visible           ${Community}    Waterford Community
        click element                       ${Community}


# Enter Button Add Menu Item
        wait until element is visible   ${Add Menu Item}
        element text should be          ${Add Menu Item}         Add Menu Item
        click element                   ${Add Menu Item}

# Do not fill the general information

# not title
         click element         ${dining_title}
# not Description
         click element        ${dining_description}
# image
         click element                          ${image}
         input text         ${image}        Salad

# click Magnifier search
         click element     ${Search}
# Search Image
         click element        id=image_2834549
# Click DONE
        click element       ${DONE}




# Do not fill the Identifiers information
# Click Tags
         click element              ${tags}

# visible Default Category Breakfast
        wait until element is visible   ${Breakfast}

# do not Select Hide on Print button
        mouse down     ${Hide_Print}




# Do not fill the Recurrences Information

# do not enter the calendar
        click element              ${Start-Date}
# do not enter repeats
        wait until element is not visible     ${Does_Not_Repeat}

# Save Meals and the capture is not visible
        click element       ${Save_btn}

# Visible Message requiered Field Tab Title "Message Alert"
        element text should be        ${Message_Alert_Title}            required Field

# Visible Message requiered Field Tab Description "Message Alert"
        element text should be        ${Message_Alert_Desc}              required Field





PR02 Automation to enter Community Waterford fill title tab not fill description Tab
        [Tags]      Validation Test       Case 2

# General Info incomplete
# fill title
         wait until element is visible      ${dining_title}
         click element                      ${dining_title}
         input text     ${dining_title}         Salad

# not Fill Description
         click element            ${dining_description}


# Do not fill the Identifiers information
# Click Tags
         click element              ${tags}

# visible Default Category Breakfast
        wait until element is visible   ${Breakfast}

# do not Select Hide on Print button
        mouse down     ${Hide_Print}


# Save Meals and the capture is not visible
        double click element       ${Save_btn}

# Visible Message requiered Field Tab Description "Message Alert"
        element text should be        ${Message_Alert_Desc}          required Field




PR03 Automation to enter Community Waterford fill in the Description field and delete the information in the Title field
        [Tags]      Validation Test       Case 3
# Remove Text Title Tab
    click element         ${dining_title}
    Press Keys            ${dining_title}     CTRL+A+DELETE

# fill Description
         click element                      ${dining_description}
         input text         ${dining_description}       pork meat, natural sage special seasonings

# click Tags Tab
        click element           ${tags}

#  Save Dinning and the capture is not visible
        Double click element       ${Save_btn}


# Visible Message requiered Field Tab Title "Message Alert"
        scroll element into view           ${Message_Alert_Title}
        wait until element is enabled      ${Message_Alert_Title}
        element text should be             ${Message_Alert_Title}          required Field








PR04 Automation to enter Community Waterford fill title and Description tab (Breakfast)
        [Tags]      Validation Test       Case 4

#  the general information complete
# Remove Text Description Tab
    click element       ${dining_description}
    Press Keys          ${dining_description}    CTRL+A+DELETE

# fill title
         click element                      ${dining_title}
         input text     ${dining_title}         Salad

# fill  Description
         click element                      ${dining_description}
         input text         ${dining_description}       Light tomato salad, cucumber



# Identifiers information complete

# fill Tags Tab
        wait until element is visible           ${tags}
        set focus to element            ${tags}
        input text         ${tags}       Delicious
        press keys         ${tags}       ENTER

# Meal Category Breakfast
# Breakfast
         wait until element is visible          ${Breakfast}
         click element                          ${Breakfast}

# Select Button Hide On Print And Return
        select checkbox     ${Hide_Print}
        unselect checkbox   ${Hide_Print}








PR05 Automation Community Waterford Enter "Does not repeat"
        [Tags]      Validation Test       Case 5

# Recurrence Information

# Visible Repets "Does Not Repeat"
         click element         ${Tab_Repeats}
         click element          ${Does_Not_Repeat}

# Visible the window Recurrence and the button save inactive

# Modify Every Weeks (increase number of weeks)
    double click element                ${modify_day}
    choose file                         ${modify_day}           1

# Increase Occurrences
     double click element            ${modify_Occurrences}
     choose file                     ${modify_Occurrences}      10

# Click Button Save Inactive
        click element       ${SaveRecurrence}

# enter the On this Date section and modify the day
# click on the END field (inside the Recurrences window)
        click element       id=EndSelection

# Select on this Date
        click element      ${On_this_date}

# enter the recurrences Calendar
        click element       ${Calendar_Recurrences}

# advance next month
        double click element       ${advance_month}

# return to current month
        click element       ${return_month}

# Modify a day in the month
        execute javascript      ${day}

# Click Button Save Inactive
        click element       ${SaveRecurrence}

# click button Cancel
        click element              ${CancelBtnRecc}


# Enter calendar outside "Does not Repeat"
# Enter Botton Calendar
        click element       ${Calendar_Btn}

# advance next month
        click element       ${advance_month}

# enter a day in the month
        execute javascript      ${day}

#  Save Dinning
        element text should be      ${Save_btn}     Save
        double click element        ${Save_btn}


# Make the Alert message "This meal has been added succesfully" visible
        wait until element is visible        ${Message_Accept}
        element should be visible            ${Message_Accept}          This meal has been added succesfully

        reload page

# simulate click the text Menu Item
        scroll element into view                 ${text Menu Item}
        wait until element is visible            ${text Menu Item}
        mouse over                               ${text Menu Item}


# Click Community Waterford
        scroll element into view            ${Community}
        wait until element is visible       ${Community}
        element should be visible           ${Community}    Waterford Community
        click element                       ${Community}

# Enter Button Add Menu Item
        scroll element into view        ${Add Menu Item}
        element text should be          ${Add Menu Item}         Add Menu Item
        click element                   ${Add Menu Item}





PR06 Automation Community Waterford "Recurrence Daily"(Lunch)
        [Tags]      Validation Test       Case 6

# the general information

# fill title
         click element                      ${dining_title}
         input text     ${dining_title}         Bacon Cheeseburger

# fill  Description
         click element                      ${dining_description}
         input text         ${dining_description}       tomato, lettuce, cheese and meat

# image
         click element                          ${image}
         input text         ${image}         Bacon

 # click Magnifier search
         click element     ${Search}
# Search Image
         click element        id=image_500054
# Click DONE
        click element       ${DONE}






# Identifiers information

# fill Tags Tab
        wait until element is visible           ${tags}
        set focus to element            ${tags}
        input text         ${tags}       Delicious
        press keys         ${tags}       ENTER
        input text         ${tags}       Exquisite Taste
        press keys         ${tags}       ENTER

# Navigating for Breakfast, Lunch
# Meal Category Lunch

# Breakfast
         wait until element is visible          ${Breakfast}
         click element                          ${Breakfast}
# Lunch
         wait until element is visible          ${Lunch}
         click element                          ${Lunch}

# Select Button Hide On Print
        select checkbox     ${Hide_Print}







# the Recurrences Information

# Enter Botton Calendar
        click element       ${Calendar_Btn}

# Click advance month
        click element       ${advance_month}

# Click Day
        execute javascript     ${days}


# Visible Repets "Recurrence Daily" and Enter
         click element         ${Tab_Repeats}
         click element         ${Daily_Recurrence}

# modify day
        double click element                ${modify_day}
        choose file                         ${modify_day}      5

# modify Occurrences
        double click element            ${modify_Occurrences}
        choose file     ${modify_Occurrences}      10
#
# Click Save button Recurrencia

        click element                           ${SaveRecurrence}
#
 # enter to Calendar

        click element                           ${Start-Date}
#
# # Click Save Button Dinning
        click element                           ${Save_btn}
#
# Make the Alert message "This meal has been added succesfully" visible
        wait until element is visible        ${Message_Accept}
        element should be visible             ${Message_Accept}         This meal has been added succesfully


    reload page


# Click Community Waterford
        scroll element into view            ${Community}
        wait until element is visible        ${Community}
        element should be visible           ${Community}    Waterford Community
        click element                       ${Community}

# Enter Button Add Menu Item
        scroll element into view        ${Add Menu Item}
        element text should be          ${Add Menu Item}         Add Menu Item
        click element                   ${Add Menu Item}







PR07 Automation to enter Community Waterford Recurrence Daily (Dinner)
        [Tags]      Validation Test       Case 7

# the general information


# fill title
         click element                      ${dining_title}
         input text     ${dining_title}         Cereal Of Choice

# fill  Description
         click element                      ${dining_description}
         input text         ${dining_description}       With 3 grams of fiber, 100% whole grain wheat flakes,12 vitamins and minerals.

# image
         click element                          ${image}
         input text         ${image}         Cereal

# click Magnifier search
         click element     ${Search}
# Search Image
         click element        id=image_898073
# Click DONE
        click element       ${DONE}

# download and make the image visible
        Execute Javascript  window.scrollTo(0,500)


#  simulate click button Save
        mouse over                          ${Save_btn}

# raise the visible tab TAG
        Execute Javascript  window.scrollTo(500,0)




# The information identifiers



# fill Tags Tab
        wait until element is visible           ${tags}
        set focus to element            ${tags}
        input text         ${tags}       Sugar
        press keys         ${tags}       ENTER
        input text         ${tags}       Warm Milk
        press keys         ${tags}       ENTER

# Meal Categories Dinner

# Dinner
         wait until element is visible          ${Dinner}
         click element                          ${Dinner}

# Select Button Hide On Print
        select checkbox     ${Hide_Print}





# The information Recurrences



 # enter Star Date Calendar
        click element             ${Start-Date}

# Enter Botton Calendar
        click element       ${Calendar_Btn}

# Click advance two month and Return one month
        Double click element       ${advance_month}
        click element                ${return_month}

# Click Day
        execute javascript     ${days1}

# Visible Repets "Recurrence Daily" and Enter
         click element         ${Tab_Repeats}
         click element         ${Daily_Recurrence}

# modify day
        double click element                ${modify_day}
        choose file                         ${modify_day}      8

# modify Occurrences
        double click element            ${modify_Occurrences}
        choose file     ${modify_Occurrences}      6

 # Click Save button Recurrencia
        wait until element is visible           ${SaveRecurrence}
        set focus to element                    ${SaveRecurrence}
        click element                           ${SaveRecurrence}

 # enter to Calendar
        scroll element into view                ${Start-Date}
        wait until element is visible           ${Start-Date}
        click element                           ${Start-Date}

 # Click Save Button Dinning
         scroll element into view                ${Save_btn}
         wait until element is visible            ${Save_btn}
         click element                           ${Save_btn}

# Make the Alert message "This meal has been added succesfully" visible
        wait until element is visible        ${Message_Accept}
        element should be visible            ${Message_Accept}         This meal has been added succesfully



