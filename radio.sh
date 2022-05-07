 #!/bin/bash

#     __                         _   __            ___ __  __
# __ / /__ _______ __ _  __ __  | | / /__ ___  ___/ (_) /_/ /____
#/ // / -_) __/ -_)  ' \/ // /  | |/ / -_) _ \/ _  / / __/ __/ _ \
#\___/\__/_/  \__/_/_/_/\_, /   |___/\__/_//_/\_,_/_/\__/\__/\___/
#                      /___/

#Jeremy Venditto
#https://github.com/jeremy-venditto
#https://jeremyvenditto.info


     #Bash Script for Software Defined Radio

#~~~~~~~~~~~~~ Config ~~~~~~~~~~~~~~
#Radio Stations
STATION_1="92.3"
STATION_2="93.3"
STATION_3="94.1"
STATION_4="95.5"
STATION_5="96.9"
STATION_6="98.1"
STATION_7="101.7"
STATION_8="103.7"
STATION_9="105.1"
STATION_10="106.3"
#~~~~~~~~~~~~ End Config ~~~~~~~~~~


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Define Colors
cyan="\e[0;96m"
bold="\e[1m"
reset="\e[0m"
# Find and kill rtl_fm process
KILL_PROC () { pgrep rtl_fm >/dev/null && pkill rtl_fm >/dev/null 2>&1 || a='nothing';}
# Play Stations 1-10
PLAY_STATION_1 () { rtl_fm -f ${STATION_1}e6 -M wbfm -s 200000 -r 48000 - | aplay -r 48000 -f S16_LE &}
PLAY_STATION_2 () { rtl_fm -f ${STATION_2}e6 -M wbfm -s 200000 -r 48000 - | aplay -r 48000 -f S16_LE &}
PLAY_STATION_3 () { rtl_fm -f ${STATION_3}e6 -M wbfm -s 200000 -r 48000 - | aplay -r 48000 -f S16_LE &}
PLAY_STATION_4 () { rtl_fm -f ${STATION_4}e6 -M wbfm -s 200000 -r 48000 - | aplay -r 48000 -f S16_LE &}
PLAY_STATION_5 () { rtl_fm -f ${STATION_5}e6 -M wbfm -s 200000 -r 48000 - | aplay -r 48000 -f S16_LE &}
PLAY_STATION_6 () { rtl_fm -f ${STATION_6}e6 -M wbfm -s 200000 -r 48000 - | aplay -r 48000 -f S16_LE &}
PLAY_STATION_7 () { rtl_fm -f ${STATION_7}e6 -M wbfm -s 200000 -r 48000 - | aplay -r 48000 -f S16_LE &}
PLAY_STATION_8 () { rtl_fm -f ${STATION_8}e6 -M wbfm -s 200000 -r 48000 - | aplay -r 48000 -f S16_LE &}
PLAY_STATION_9 () { rtl_fm -f ${STATION_9}e6 -M wbfm -s 200000 -r 48000 - | aplay -r 48000 -f S16_LE &}
PLAY_STATION_10 () { rtl_fm -f ${STATION_10}e6 -M wbfm -s 200000 -r 48000 - | aplay -r 48000 -f S16_LE &}
# List after selecting radio station
function OPTIONS {
PS3='Please enter your choice: '
options=("Change Station" "Volume Control" "Turn Off Radio" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Change Station")
            MAIN
            break
            ;;
        "Volume Control")
            pavucontrol && echo 'Pulse Audio Volume Control has been opened.'
            ;;
        "Turn Off Radio")
            pkill rtl_fm
            break
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
}
# Main Menu / Radio Station Selection
function MAIN {
echo;echo -e ${bold}"FM Radio Stations"${reset}
PS3='Please enter your choice: '
options=("$STATION_1" "$STATION_2" "$STATION_3" "$STATION_4" "$STATION_5" "$STATION_6" "$STATION_7" "$STATION_8" "$STATION_9" "$STATION_10" "Turn Off Radio" "Quit")
select opt in "${options[@]}"
do
    case $opt in
"$STATION_1")
KILL_PROC && PLAY_STATION_1 > /dev/null 2>&1 && echo 'loading...' && sleep 2 && echo && echo -e ${cyan}"Playing $STATION_1"${reset} && OPTIONS
break
;;
"$STATION_2")
KILL_PROC && PLAY_STATION_2 > /dev/null 2>&1 && echo 'loading...' && sleep 2 && echo && echo -e ${cyan}"Playing $STATION_2"${reset} && OPTIONS
break
;;
"$STATION_3")
KILL_PROC && PLAY_STATION_3 > /dev/null 2>&1 && echo 'loading...' && sleep 2 && echo && echo -e ${cyan}"Playing $STATION_3"${reset} && OPTIONS
break
;;
"$STATION_4")
KILL_PROC && PLAY_STATION_4 > /dev/null 2>&1 && echo 'loading...' && sleep 2 && echo && echo -e ${cyan}"Playing $STATION_4"${reset} && OPTIONS
break
;;
"$STATION_5")
KILL_PROC && PLAY_STATION_5 > /dev/null 2>&1 && echo 'loading...' && sleep 2 && echo && echo -e ${cyan}"Playing $STATION_5"${reset} && OPTIONS
break
;;
"$STATION_6")
KILL_PROC && PLAY_STATION_6 > /dev/null 2>&1 && echo 'loading...' && sleep 2 && echo && echo -e ${cyan}"Playing $STATION_6"${reset} && OPTIONS
break
;;
"$STATION_7")
KILL_PROC && PLAY_STATION_7 > /dev/null 2>&1 && echo 'loading...' && sleep 2 && echo && echo -e ${cyan}"Playing $STATION_7"${reset} && OPTIONS
break
;;
"$STATION_8")
KILL_PROC && PLAY_STATION_8 > /dev/null 2>&1 && echo 'loading...' && sleep 2 && echo && echo -e ${cyan}"Playing $STATION_8"${reset} && OPTIONS
break
;;
"$STATION_9")
KILL_PROC && PLAY_STATION_9 > /dev/null 2>&1 && echo 'loading...' && sleep 2 && echo && echo -e ${cyan}"Playing $STATION_9"${reset} && OPTIONS
break
;;
"$STATION_10")
KILL_PROC && PLAY_STATION_10 > /dev/null 2>&1 && echo 'loading...' && sleep 2 && echo && echo -e ${cyan}"Playing $STATION_10"${reset} && OPTIONS
break
;;
"Turn Off Radio")
KILL_PROC
break
;;
"Quit")
break
;;
*) echo "invalid option $REPLY";;
esac
done
}

################################# HELP SCREEN #################################

#Help()
function HELP_FUNCTION {
   # Display Help
   echo
   echo -e ${cyan}"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"${reset}
   echo
   echo -e ${yellow}"                  \e[1mHelp Screen for radio.sh\e[0m"${reset}
   echo
   echo "Syntax: [ |-1|-2|-3|-4|-5|-6|-7|-8|-9|-h|-v| ]"
   echo
   echo -e ${green}"Option:    Description:"${reset}
   echo
   echo "-1  ~~~~~  Connect to $STATION_1"
   echo "-2  ~~~~~  Connect to $STATION_2"
   echo "-3  ~~~~~  Connect to $STATION_3"
   echo "-4  ~~~~~  Connect to $STATION_4"
   echo "-5  ~~~~~  Connect to $STATION_5"
   echo "-6  ~~~~~  Connect to $STATION_6"
   echo "-7  ~~~~~  Connect to $STATION_7"
   echo "-8  ~~~~~  Connect to $STATION_8"
   echo "-9  ~~~~~  Connect to $STATION_9"
   echo "-0  ~~~~~  Connect to $STATION_10"
   echo "-h  ~~~~~  Print this help and exit"
   echo "-v  ~~~~~  Print software version and exit."
   echo
   echo -e ${cyan}"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"${reset}
}

################################# Flag options #################################
# Get the options
while getopts ":0123456789hv" option; do
   case $option in
      1) # Connect to Station 1
         KILL_PROC && PLAY_STATION_1 > /dev/null 2>&1 && echo 'loading...' && sleep 2 && echo && echo -e ${cyan}"Playing $STATION_1"${reset}
         exit;;
      2) # Connect to Station 2
         KILL_PROC && PLAY_STATION_2 > /dev/null 2>&1 && echo 'loading...' && sleep 2 && echo && echo -e ${cyan}"Playing $STATION_2"${reset}
         exit;;
      3) # Connect to Station 3
         KILL_PROC && PLAY_STATION_3 > /dev/null 2>&1 && echo 'loading...' && sleep 2 && echo && echo -e ${cyan}"Playing $STATION_3"${reset}
         exit;;
      4) # Connect to Station 4
         KILL_PROC && PLAY_STATION_4 > /dev/null 2>&1 && echo 'loading...' && sleep 2 && echo && echo -e ${cyan}"Playing $STATION_4"${reset}
         exit;;
      5) # Connect to Station 5
         KILL_PROC && PLAY_STATION_5 > /dev/null 2>&1 && echo 'loading...' && sleep 2 && echo && echo -e ${cyan}"Playing $STATION_5"${reset}
         exit;;
      6) # Connect to Station 6
         KILL_PROC && PLAY_STATION_6 > /dev/null 2>&1 && echo 'loading...' && sleep 2 && echo && echo -e ${cyan}"Playing $STATION_6"${reset}
         exit;;
      7) # Connect to Station 7
         KILL_PROC && PLAY_STATION_7 > /dev/null 2>&1 && echo 'loading...' && sleep 2 && echo && echo -e ${cyan}"Playing $STATION_7"${reset}
         exit;;
      8) # Connect to Station 8
         KILL_PROC && PLAY_STATION_8 > /dev/null 2>&1 && echo 'loading...' && sleep 2 && echo && echo -e ${cyan}"Playing $STATION_8"${reset}
         exit;;
      9) # Connect to Station 9
         KILL_PROC && PLAY_STATION_9 > /dev/null 2>&1 && echo 'loading...' && sleep 2 && echo && echo -e ${cyan}"Playing $STATION_9"${reset}
         exit;;
      0) # Connect to Station 10
         KILL_PROC && PLAY_STATION_10 > /dev/null 2>&1 && echo 'loading...' && sleep 2 && echo && echo -e ${cyan}"Playing $STATION_10"${reset}
         exit;;

      h) # Print This Help
         HELP_FUNCTION
         exit;;
      v) # version number
        echo "0.1"
         exit;;
     \?) # Invalid option
         echo "Error: Invalid option"
         exit;;
   esac
done



#~~~~Script~~~~
MAIN
