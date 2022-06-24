#!/bin/bash

# Find Modified Files / Directories within a specific time frame

# add temp files to dump results to and add prompt to grep them if needed

function CHECK_MONTH {
CURRENT_MONTH=$(date | cut -d ' ' -f 2)
if
[[ $CURRENT_MONTH = "Jan" ]]; then THIS_MONTH="01"; elif
[[ $CURRENT_MONTH = "Feb" ]]; then THIS_MONTH="02"; elif
[[ $CURRENT_MONTH = "Mar" ]]; then THIS_MONTH="03"; elif
[[ $CURRENT_MONTH = "Apr" ]]; then THIS_MONTH="04"; elif
[[ $CURRENT_MONTH = "May" ]]; then THIS_MONTH="05"; elif
[[ $CURRENT_MONTH = "Jun" ]]; then THIS_MONTH="06"; elif
[[ $CURRENT_MONTH = "Jul" ]]; then THIS_MONTH="07"; elif
[[ $CURRENT_MONTH = "Aug" ]]; then THIS_MONTH="08"; elif
[[ $CURRENT_MONTH = "Sep" ]]; then THIS_MONTH="09"; elif
[[ $CURRENT_MONTH = "Oct" ]]; then THIS_MONTH="10"; elif
[[ $CURRENT_MONTH = "Nov" ]]; then THIS_MONTH="11"; elif
[[ $CURRENT_MONTH = "Dec" ]]; then THIS_MONTH="12";
fi
echo "$THIS_MONTH"
}

YEAR=$(date | cut -d ' ' -f 6)
MONTH=$(CHECK_MONTH)
DAY=$(date | cut -d ' ' -f 3)
TODAY=$(echo "${YEAR}-${MONTH}-${DAY}")


function CUSTOM_TIMEFRAME {
echo "Enter Start Date (YYYY-MM-DD)"
read -r -p "> " START_DATE
echo "Enter End Date (blank for today}"
read -r -p "> " END_DATE
if [[ -z $END_DATE ]]; then END_DATE=$TODAY;fi
find . -type d -newermt "$START_DATE" \! -newermt "$END_DATE" -exec ls -ld {} \;
}

function YEAR_START {
find . -type d -newermt "${YEAR}-01-01" \! -newermt "$TODAY" -exec ls -ld {} \;
}

function MONTH_START {
read -r -p "Grep Results? [Y/n] " input ; case $input in
    [yY][eE][sS]|[yY]) 
read -r -p "Enter grep text here? " USEGREP
a=$(find . -type d -newermt "${YEAR}-${MONTH}-01" \! -newermt "$TODAY" -exec ls -ld {} \;) 
$a | $USEGREP
    ;;
    [nN][oO]|[nN])
find . -type d -newermt "${YEAR}-${MONTH}-01" \! -newermt "$TODAY" -exec ls -ld {} \;
    ;;
    *) echo "Invalid input...";exit 1;;esac
}

function MODIFIED_LAST_24_HOURS {
find . -type d -newermt "$TODAY" \! -newermt "$TODAY" -exec ls -ld {} \;
}

function MODIFIED_TODAY {
find . -type d -newermt "$TODAY" \! -newermt "$TODAY" -exec ls -ld {} \;
}

function MODIFIED_TODAY_2 {
read -r -p "Grep Results? [Y/n] " input ; case $input in
    [yY][eE][sS]|[yY]) 
read -r -p "Enter grep text here? " USEGREP
a=$(find . -type d -newermt "$TODAY" \! -newermt "$TODAY" -exec ls -ld {} \;) 
$a | grep -e $USEGREP
    ;;
    [nN][oO]|[nN])
find . -type d -newermt "$TODAY" \! -newermt "$TODAY" -exec ls -ld {} \;
    ;;
    *) echo "Invalid input...";exit 1;;esac
}



echo 'Find Modified Files and Directories'
PS3='Please enter your choice: '
options=("Last 8 Hours" "Last 24 Hours" "Today" "Month Start" "Year Start" "Custom Timeframe" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Last 8 Hours")
            LAST_8_HOURS
            break
            ;;
        "Last 24 Hours")
            LAST_24_HOURS
            break
            ;;
        "Today")
            MODIFIED_TODAY_2
            break
            ;;
        "Month Start")
            MONTH_START
            break
            ;;
        "Year Start")
            YEAR_START
            break
            ;;
        "Custom Timeframe")
            CUSTOM_TIMEFRAME
            break
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
