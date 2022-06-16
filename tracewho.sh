#!/bin/bash

red="\e[0;91m";blue="\e[0;94m";magenta="\e[0;95m";green="\e[0;92m"
yellow="\e[0;93m";bold="\e[1m";uline="\e[4m";reset="\e[0m"

# Check for Missing Packages
# Required Packages: traceroute, whois
function MISSING_PACKAGES {
pacman -Q traceroute whois > /tmp/tracewho_error.txt 2>&1
MISSING_PKGS=$(cat /tmp/tracewho_error.txt | grep error | cut -d ' ' -f 3 | sed -e 's/^.//' -e 's/.$//')
if [[ -z "$MISSING_PKGS" ]]; then abc=zzz ; else
echo -e ${bold}${uline}${red}"Missing Packages:"${reset}
echo -e ${yellow}"$MISSING_PKGS"${reset}
read -r -p "Install Missing Packages? [Y/n] " input ; case $input in
    [yY][eE][sS]|[yY]) sudo pacman -S $(echo $(echo "$MISSING_PKGS")) && rm error.txt ;;
    [nN][oO]|[nN]) rm /tmp/tracewho_error.txt ;;
    *) echo "Invalid input..." rm /tmp/tracewho_error.txt ;exit 1;;esac;fi
}

function HOP_COUNT {
# Finding the number of ip addresses in the /tmp/tracewho.tmp file
aaa=$(grep ms /tmp/tracewho.txt | cut -d ' ' -f 3-4 | wc -l)
# Subtract 1 for your router (at the end of script to display number of hops)
bbb=$(echo $((${aaa}-1)))
echo
if
   [[ $aaa = 2 ]]; then HOP_ROUTER && HOP_1; elif
   [[ $aaa = 3 ]]; then HOP_ROUTER && HOP_1 && HOP_2; elif
   [[ $aaa = 4 ]]; then HOP_ROUTER && HOP_1 && HOP_2 && HOP_3; elif
   [[ $aaa = 5 ]]; then HOP_ROUTER && HOP_1 && HOP_2 && HOP_3 && HOP_4; elif
   [[ $aaa = 6 ]]; then HOP_ROUTER && HOP_1 && HOP_2 && HOP_3 && HOP_4 && HOP_5; elif
   [[ $aaa = 7 ]]; then HOP_ROUTER && HOP_1 && HOP_2 && HOP_3 && HOP_4 && HOP_5 && HOP_6; elif
   [[ $aaa = 8 ]]; then HOP_ROUTER && HOP_1 && HOP_2 && HOP_3 && HOP_4 && HOP_5 && HOP_6 && HOP_7; elif
   [[ $aaa = 9 ]]; then HOP_ROUTER && HOP_1 && HOP_2 && HOP_3 && HOP_4 && HOP_5 && HOP_6 && HOP_7 && HOP_8; elif
   [[ $aaa = 10 ]]; then HOP_ROUTER && HOP_1 && HOP_2 && HOP_3 && HOP_4 && HOP_5 && HOP_6 && HOP_7 && HOP_8 && HOP_9; elif
   [[ $aaa = 11 ]]; then HOP_ROUTER && HOP_1 && HOP_2 && HOP_3 && HOP_4 && HOP_5 && HOP_6 && HOP_7 && HOP_8 && HOP_9 && HOP_10; elif
   [[ $aaa = 12 ]]; then HOP_ROUTER && HOP_1 && HOP_2 && HOP_3 && HOP_4 && HOP_5 && HOP_6 && HOP_7 && HOP_8 && HOP_9 && HOP_10 && HOP_11; elif
   [[ $aaa = 13 ]]; then HOP_ROUTER && HOP_1 && HOP_2 && HOP_3 && HOP_4 && HOP_5 && HOP_6 && HOP_7 && HOP_8 && HOP_9 && HOP_10 && HOP_11 && HOP_12; elif
   [[ $aaa = 14 ]]; then HOP_ROUTER && HOP_1 && HOP_2 && HOP_3 && HOP_4 && HOP_5 && HOP_6 && HOP_7 && HOP_8 && HOP_9 && HOP_10 && HOP_11 && HOP_12 && HOP_13; elif
   [[ $aaa = 15 ]]; then HOP_ROUTER && HOP_1 && HOP_2 && HOP_3 && HOP_4 && HOP_5 && HOP_6 && HOP_7 && HOP_8 && HOP_9 && HOP_10 && HOP_11 && HOP_12 && HOP_13 && HOP_14
else
echo 'Too many hops for this program.. max 14 hops.. sorry.. fix me and submit a pull request.'
fi
}

function HOP_ROUTER {
# Text
echo -e ${reset}${bold}"Your Router:" $reset ${yellow}
# Read line 1 of /tmp/tracewho.txt and grep the IP address
sed -n '1p' /tmp/tracewho.txt | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}"
echo
}

function HOP_1 {
# Read line 2 of /tmp/tracewho.txt and grep the IP address
a=$(sed -n '2p' /tmp/tracewho.txt | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}")
# 2nd variable because the names will not be displayed correctly in variable $c
# cut was just the first thing i tried and it worked so..
b=$(echo $a | cut -d ' ' -f 1)
# Text
echo -e ${reset}${bold}'Hop 1:' $reset
# Display IP address
echo -e ${blue}${b}${reset}
# Run whois information on IP address and grep the company name
c=$(whois $b | grep -e OrgName -e name | grep -v netname | cut -d ' ' -f 8-25 | sed -E 's/^\s*//')
# Display company name
echo -e ${green}${c}${reset}
echo
}

function HOP_2 {
a=$(sed -n '3p' /tmp/tracewho.txt | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}")
b=$(echo $a | cut -d ' ' -f 1)
echo -e $bold'Hop 2:' $reset
echo -e ${blue}${b}${reset}
c=$(whois $b | grep -e OrgName -e name | grep -v netname | cut -d ' ' -f 8-25 | sed -E 's/^\s*//')
echo -e ${green}${c}${reset}
echo
}

function HOP_3 {
a=$(sed -n '4p' /tmp/tracewho.txt | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}")
b=$(echo $a | cut -d ' ' -f 1)
echo -e $bold'Hop 3:' $reset
echo -e ${blue}${b}${reset}
c=$(whois $b | grep -e OrgName -e name | grep -v netname | cut -d ' ' -f 8-25 | sed -E 's/^\s*//')
echo -e ${green}${c}${reset}
echo
}

function HOP_4 {
a=$(sed -n '5p' /tmp/tracewho.txt | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}")
b=$(echo $a | cut -d ' ' -f 1)
echo -e $bold'Hop 4:' $reset
echo -e ${blue}${b}${reset}
c=$(whois $b | grep -e OrgName -e name | grep -v netname | cut -d ' ' -f 8-25 | sed -E 's/^\s*//')
echo -e ${green}${c}${reset}
echo
}

function HOP_5 {
a=$(sed -n '6p' /tmp/tracewho.txt | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}")
b=$(echo $a | cut -d ' ' -f 1)
echo -e $bold'Hop 5:' $reset
echo -e ${blue}${b}${reset}
c=$(whois $b | grep -e OrgName -e name | grep -v netname | cut -d ' ' -f 8-25 | sed -E 's/^\s*//')
echo -e ${green}${c}${reset}
echo
}

function HOP_6 {
a=$(sed -n '7p' /tmp/tracewho.txt | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}")
b=$(echo $a | cut -d ' ' -f 1)
echo -e $bold'Hop 6:' $reset
echo -e ${blue}${b}${reset}
c=$(whois $b | grep -e OrgName -e name | grep -v netname | cut -d ' ' -f 8-25 | sed -E 's/^\s*//')
echo -e ${green}${c}${reset}
echo
}

function HOP_7 {
a=$(sed -n '8p' /tmp/tracewho.txt | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}")
b=$(echo $a | cut -d ' ' -f 1)
echo -e $bold'Hop 7:' $reset
echo -e ${blue}${b}${reset}
c=$(whois $b | grep -e OrgName -e name | grep -v netname | cut -d ' ' -f 8-25 | sed -E 's/^\s*//')
echo -e ${green}${c}${reset}
echo
}

function HOP_8 {
a=$(sed -n '9p' /tmp/tracewho.txt | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}")
b=$(echo $a | cut -d ' ' -f 1)
echo -e $bold'Hop 8:' $reset
echo -e ${blue}${b}${reset}
c=$(whois $b | grep -e OrgName -e name | grep -v netname | cut -d ' ' -f 8-25 | sed -E 's/^\s*//')
echo -e ${green}${c}${reset}
echo
}

function HOP_9 {
a=$(sed -n '10p' /tmp/tracewho.txt | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}")
b=$(echo $a | cut -d ' ' -f 1)
echo -e $bold'Hop 9:' $reset
echo -e ${blue}${b}${reset}
c=$(whois $b | grep -e OrgName -e name | grep -v netname | cut -d ' ' -f 8-25 | sed -E 's/^\s*//')
echo -e ${green}${c}${reset}
echo
}

function HOP_10 {
a=$(sed -n '11p' /tmp/tracewho.txt | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}")
b=$(echo $a | cut -d ' ' -f 1)
echo -e $bold'Hop 10:' $reset
echo -e ${blue}${b}${reset}
c=$(whois $b | grep -e OrgName -e name | grep -v netname | cut -d ' ' -f 8-25 | sed -E 's/^\s*//')
echo -e ${green}${c}${reset}
echo
}

function HOP_11 {
a=$(sed -n '12p' /tmp/tracewho.txt | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}")
b=$(echo $a | cut -d ' ' -f 1)
echo -e $bold'Hop 11:' $reset
echo -e ${blue}${b}${reset}
c=$(whois $b | grep -e OrgName -e name | grep -v netname | cut -d ' ' -f 8-25 | sed -E 's/^\s*//')
echo -e ${green}${c}${reset}
echo
}

function HOP_12 {
a=$(sed -n '13p' /tmp/tracewho.txt | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}")
b=$(echo $a | cut -d ' ' -f 1)
echo -e $bold'Hop 12:' $reset
echo -e ${blue}${b}${reset}
c=$(whois $b | grep -e OrgName -e name | grep -v netname | cut -d ' ' -f 8-25 | sed -E 's/^\s*//')
echo -e ${green}${c}${reset}
echo
}

function HOP_13 {
a=$(sed -n '14p' /tmp/tracewho.txt | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}")
b=$(echo $a | cut -d ' ' -f 1)
echo -e $bold'Hop 13:' $reset
echo -e ${blue}${b}${reset}
c=$(whois $b | grep -e OrgName -e name | grep -v netname | cut -d ' ' -f 8-25 | sed -E 's/^\s*//')
echo -e ${green}${c}${reset}
echo
}

function HOP_14 {
a=$(sed -n '15p' /tmp/tracewho.txt | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}")
b=$(echo $a | cut -d ' ' -f 1)
echo -e $bold'Hop 14:' $reset
echo -e ${blue}${b}${reset}
c=$(whois $b | grep -e OrgName -e name | grep -v netname | cut -d ' ' -f 8-25 | sed -E 's/^\s*//')
echo -e ${green}${c}${reset}
echo
}

# Logo at script start
function LOGO {
echo -e ${bold}  "     _                               _             "
echo -e ${bold}  "    | |                             | |            "
echo -e ${bold}  "   _| |_ _ __ __ _  ___ _____      _| |__   ___    "
echo -e ${bold}  "  |_  __| .__/ _. |/ __/ _ \ \ /\ / / '_ \ / _ \   "
echo -e ${bold}  "    | |_| | | (_| | (_|  __/\ V  V /| | | | (_) |  "
echo -e ${bold}  "     \__|_|  \__,_|\___\___| \_/\_/ |_| |_|\___/   "
echo -e ${uline} "                                                   " ${reset}
echo
}

# Spacer function provides an expandable border depending on URL size
function SPACER {
printf ${yellow}'----------' && printf '%0.s-' $(seq 1 ${#URL})${reset}
}


function FLAG_N__MAX_HOPS {
# make a master hop variable number and have the script check this first..
# then on each traceroute command make a function to check here first for the variable
echo 'coming soon'
}

################################# HELP SCREEN #################################

function HELP_FUNCTION {
   # Display Help
   echo
   echo -e ${cyan}"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"${reset}
   echo
   echo -e ${yellow}"                  \e[1mHelp Screen for tracewho.sh\e[0m"${reset}
   echo
   echo "Syntax: [ |-h|-n|-v| ]"
   echo
   echo -e ${green}"Option:    Description:"${reset}
   echo
   echo "-h  ~~~~~  Print this Help."
   echo "-n  ~~~~~  Number of max traceroute hops (coming soon)"
   echo "-v  ~~~~~  Print software version and exit."
   echo
   echo -e ${cyan}"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"${reset}
}

################################# Flag options #################################
# Get the options
while getopts ":hnv" option; do
   case $option in
      h) # Print Help Screen
         HELP_FUNCTION
         exit;;
      n) # Number of max hops to take
         FLAG_N__MAX_HOPS
         exit;;
      v) # version number
        echo "0.3"
         exit;;
     \?) # Invalid option
         echo "Error: Invalid option"
         exit;;
   esac
done

######################
#### SCRIPT START ####
######################

# Check for missing packages
MISSING_PACKAGES

# max hops variable?
# maybe

# Logo
LOGO

### Prompt ###
read -rp 'Enter Website: ' URL
echo 'please be patient.. gathering information'
traceroute -n -m 20 $URL | grep ms > /tmp/tracewho.txt

### Static Website ###
#URL="google.com"
#traceroute -n -m 20 $URL | grep ms > /tmp/tracewho.txt

# Traceroute raw information to view while waiting
echo -e $blue && traceroute -n -m 20 $URL

# Hop Count, IP addr and Vendor Name
HOP_COUNT

# Display Number of hops
SPACER;echo -e ${reset}
echo -e "${red}${uline}$bbb Hops${reset} to ${magenta}${URL}${reset}"
SPACER;echo -e ${reset}
echo
