#!/bin/bash

#     __                         _   __            ___ __  __
# __ / /__ _______ __ _  __ __  | | / /__ ___  ___/ (_) /_/ /____
#/ // / -_) __/ -_)  ' \/ // /  | |/ / -_) _ \/ _  / / __/ __/ _ \
#\___/\__/_/  \__/_/_/_/\_, /   |___/\__/_//_/\_,_/_/\__/\__/\___/
#                      /___/

#Jeremy Venditto
#https://github.com/jeremy-venditto
#https://jeremyvenditto.info


     #Bash Script for Disk Information

red="\e[0;91m"
blue="\e[0;94m"
cyan="\e[0;96m"
magenta="\e[0;95m"
green="\e[0;92m"
white="\e[0;97m"
yellow="\e[0;93m"
bold="\e[1m"
reset="\e[0m"

DRIVE_NAME=$(lsblk -frn | cut -d ' ' -f 1)
FS_TYPE=$(lsblk -frn | cut -d ' ' -f 2 | sed -e 's/^$/none/')
FAT_32=$(lsblk -frn | cut -d ' ' -f 3 | sed -e 's/^$/none/')
LABEL=$(lsblk -frn | cut -d ' ' -f 4 | sed -e 's/^$/none/')
UUID=$(lsblk -frn | cut -d ' ' -f 5 | sed -e 's/^$/none/')
AVAILABLE_SPACE=$(lsblk -frn | cut -d ' ' -f 6 | sed -e 's/^$/none/')
PERCENT_USED=$(lsblk -frn | cut -d ' ' -f 7 | sed -e 's/^$/none/')
MOUNTPOINT=$(lsblk -frn | cut -d ' ' -f 8 | sed -e 's/^$/none/')
TOTAL_SIZE=$(lsblk -r | grep -v NAME | cut -d ' ' -f4 | sed -e 's/^$/none/')
TOTAL_PARTITIONS=$(lsblk -frn | cut -d' ' -f1 | wc -l)
OPTICAL=$(lsblk -frn | cut -d ' ' -f 1 | grep sr0)
OPTICAL_NUMBER=$(echo $OPTICAL | wc -l)
DISKS=$(lsblk -d | cut -d' ' -f 1 | grep -v NAME | grep -v $OPTICAL)
DISK_NUMBER=$(echo "$DISKS" | wc -l)
TOTAL_PARTITIONS_REVISED=$((($TOTAL_PARTITIONS-$DISK_NUMBER-$OPTICAL_NUMBER)))

function NO_COLOR {
START=1
END=$(echo $TOTAL_PARTITIONS)
## save $START, just in case if we need it later ##
i=$START
while [[ $i -le $END ]]
do
NEWDRIVE=$(echo $DRIVE_NAME | cut -d ' ' -f $i)
DRIVETYPE=$(echo $FS_TYPE | cut -d ' ' -f $i)
DRIVETYPE2=$(echo $FAT_32 | cut -d ' ' -f $i)
DRIVELABEL=$(echo $LABEL | cut -d ' ' -f $i)
DRIVEUUID=$(echo $UUID | cut -d ' ' -f $i)
DRIVEMOUNTPOINT=$(echo $MOUNTPOINT | cut -d ' ' -f $i)
DRIVETOTALSIZE=$(echo $TOTAL_SIZE | cut -d ' ' -f $i)
DRIVEPERCUSED=$(echo $PERCENT_USED | cut -d ' ' -f $i)
DRIVEAVAILABLE=$(echo $AVAILABLE_SPACE | cut -d ' ' -f $i)
echo "Disk Name: $NEWDRIVE   Label: $DRIVELABEL"
echo "UUID: $DRIVEUUID"
echo "FS Type: $DRIVETYPE   FS Version: $DRIVETYPE2"
echo "Total Size: $DRIVETOTALSIZE  Used: $DRIVEPERCUSED  Available: $DRIVEAVAILABLE"
echo "Mount Point: $DRIVEMOUNTPOINT"
echo
    ((i = i + 1))
done
echo "$OPTICAL_NUMBER Optical Disks:"
echo "$OPTICAL"
echo "$DISK_NUMBER Data Disks:"
echo "$DISKS"
echo "$TOTAL_PARTITIONS_REVISED Partitions"
echo
}


function NO_COLOR_SEPARATE_LINES {
START=1
END=$(echo $TOTAL_PARTITIONS)
## save $START, just in case if we need it later ##
i=$START
while [[ $i -le $END ]]
do
NEWDRIVE=$(echo $DRIVE_NAME | cut -d ' ' -f $i)
DRIVETYPE=$(echo $FS_TYPE | cut -d ' ' -f $i)
DRIVETYPE2=$(echo $FAT_32 | cut -d ' ' -f $i)
DRIVELABEL=$(echo $LABEL | cut -d ' ' -f $i)
DRIVEUUID=$(echo $UUID | cut -d ' ' -f $i)
DRIVEMOUNTPOINT=$(echo $MOUNTPOINT | cut -d ' ' -f $i)
DRIVETOTALSIZE=$(echo $TOTAL_SIZE | cut -d ' ' -f $i)
DRIVEPERCUSED=$(echo $PERCENT_USED | cut -d ' ' -f $i)
DRIVEAVAILABLE=$(echo $AVAILABLE_SPACE | cut -d ' ' -f $i)
echo "Disk Name: $NEWDRIVE"
echo "Label: $DRIVELABEL"
echo "UUID: $DRIVEUUID"
echo "FS Type: $DRIVETYPE"
echo "FS Version: $DRIVETYPE2"
echo "Total Size: $DRIVETOTALSIZE"
echo "Used: $DRIVEPERCUSED"
echo "Available: $DRIVEAVAILABLE"
echo "Mount Point: $DRIVEMOUNTPOINT"
echo
    ((i = i + 1))
done
echo "$OPTICAL_NUMBER Optical Disks:"
echo "$OPTICAL"
echo "$DISK_NUMBER Data Disks:"
echo "$DISKS"
echo "$TOTAL_PARTITIONS_REVISED Partitions"
echo
}


function COLOR {
START=1
END=$(echo $TOTAL_PARTITIONS)
## save $START, just in case if we need it later ##
i=$START
while [[ $i -le $END ]]
do
NEWDRIVE=$(echo $DRIVE_NAME | cut -d ' ' -f $i)
DRIVETYPE=$(echo $FS_TYPE | cut -d ' ' -f $i)
DRIVETYPE2=$(echo $FAT_32 | cut -d ' ' -f $i)
DRIVELABEL=$(echo $LABEL | cut -d ' ' -f $i)
DRIVEUUID=$(echo $UUID | cut -d ' ' -f $i)
DRIVEMOUNTPOINT=$(echo $MOUNTPOINT | cut -d ' ' -f $i)
DRIVETOTALSIZE=$(echo $TOTAL_SIZE | cut -d ' ' -f $i)
DRIVEPERCUSED=$(echo $PERCENT_USED | cut -d ' ' -f $i)
DRIVEAVAILABLE=$(echo $AVAILABLE_SPACE | cut -d ' ' -f $i)
echo -e "${bold}Disk Name:${reset} ${blue}$NEWDRIVE${reset}   ${bold}Label:${reset} ${blue}$DRIVELABEL${reset}"
echo -e "${bold}UUID: ${reset}${yellow}$DRIVEUUID${reset}"
echo -e "${bold}FS Type:${reset} ${green}$DRIVETYPE${reset}   ${bold}FS Version:${reset} ${green}$DRIVETYPE2${reset}"
echo -e "${bold}Total Size:${reset} ${cyan}$DRIVETOTALSIZE${reset}  ${bold}Used:${reset} ${red}$DRIVEPERCUSED${reset}  ${bold}Available:${reset} ${yellow}$DRIVEAVAILABLE${reset}"
echo -e "${bold}Mount Point:${reset} ${magenta}$DRIVEMOUNTPOINT${reset}"
echo
    ((i = i + 1))
done
echo "$OPTICAL_NUMBER Optical Disks:"
echo "$OPTICAL"
echo "$DISK_NUMBER Data Disks:"
echo "$DISKS"
echo "$TOTAL_PARTITIONS_REVISED Partitions"
echo
}


function COLOR_SEPARATE_LINES {
START=1
END=$(echo $TOTAL_PARTITIONS)
## save $START, just in case if we need it later ##
i=$START
while [[ $i -le $END ]]
do
NEWDRIVE=$(echo $DRIVE_NAME | cut -d ' ' -f $i)
DRIVETYPE=$(echo $FS_TYPE | cut -d ' ' -f $i)
DRIVETYPE2=$(echo $FAT_32 | cut -d ' ' -f $i)
DRIVELABEL=$(echo $LABEL | cut -d ' ' -f $i)
DRIVEUUID=$(echo $UUID | cut -d ' ' -f $i)
DRIVEMOUNTPOINT=$(echo $MOUNTPOINT | cut -d ' ' -f $i)
DRIVETOTALSIZE=$(echo $TOTAL_SIZE | cut -d ' ' -f $i)
DRIVEPERCUSED=$(echo $PERCENT_USED | cut -d ' ' -f $i)
DRIVEAVAILABLE=$(echo $AVAILABLE_SPACE | cut -d ' ' -f $i)
echo -e "${bold}Disk Name:${reset} ${blue}$NEWDRIVE${reset}"
echo -e "${bold}Label:${reset} ${blue}$DRIVELABEL${reset}"
echo -e "${bold}UUID:${reset} ${yellow}$DRIVEUUID${reset}"
echo -e "${bold}FS Type:${reset} ${green}$DRIVETYPE${reset}"
echo -e "${bold}FS Version:${reset} ${green}$DRIVETYPE2${reset}"
echo -e "${bold}Total Size:${reset} ${cyan}$DRIVETOTALSIZE${reset}"
echo -e "${bold}Used:${reset} ${red}$DRIVEPERCUSED${reset}"
echo -e "${bold}Available: ${yellow}$DRIVEAVAILABLE${reset}"
echo -e "${bold}Mount Point: ${magenta}$DRIVEMOUNTPOINT${reset}"
echo
    ((i = i + 1))
done
echo "$OPTICAL_NUMBER Optical Disks:"
echo "$OPTICAL"
echo "$DISK_NUMBER Data Disks:"
echo "$DISKS"
echo "$TOTAL_PARTITIONS_REVISED Partitions"
echo
}


################################# HELP SCREEN #################################

#Help()
function HELP_FUNCTION {
   # Display Help
   echo
   echo -e ${cyan}"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"${reset}
   echo
   echo -e ${yellow}"                  \e[1mHelp Screen for disk-info.sh\e[0m"${reset}
   echo
   echo "Syntax: [ |-h|-n|-v| ]"
   echo
   echo -e ${green}"Option:    Description:"${reset}
   echo
   echo "-g  ~~~~~  Globbed together (with color)"
   echo "-h  ~~~~~  Print this Help."
   echo "-n  ~~~~~  No color (separate lines)"
   echo "-x  ~~~~~  No color (globbed together)"
   echo "-v  ~~~~~  Print software version and exit."
   echo
   echo -e ${cyan}"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"${reset}
}

################################# Flag options #################################
# Get the options
while getopts ":ghnsvx" option; do
   case $option in
      g) # globbed together with color
         COLOR
         exit;;
      h) # Print Help Screen
         HELP_FUNCTION
         exit;;
      n) # no color output globbed together
         NO_COLOR
         exit;;
      s) # separate lines
         COLOR_SEPARATE_LINES
         exit;;
      x) # no color separate lines
         NO_COLOR_SEPARATE_LINES
         exit;;
      v) # version number
        echo "0.31"
         exit;;
     \?) # Invalid option
         echo "Error: Invalid option"
         exit;;
   esac
done




#NO_COLOR
#NO_COLOR_SEPARATE_LINES
#COLOR
COLOR_SEPARATE_LINES
