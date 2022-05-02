#!/bin/bash

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#                                 _            _
#  ___ ___  _ __ ___  _ __  _   _| |_ ___ _ __(_) ___ _ __ _ __ ___  ___
# / __/ _ \| '_ ` _ \| '_ \| | | | __/ _ \ '__| |/ _ \ '__| '_ ` _ \/ __|
#| (_| (_) | | | | | | |_) | |_| | ||  __/ |  | |  __/ |  | | | | | \__ \
# \___\___/|_| |_| |_| .__/ \__,_|\__\___|_| _/ |\___|_|  |_| |_| |_|___/
#                    |_|                    |__/
#
#https://www.computerjerms.com
#https://github.com/computerjerms
#
#This is an Arch Linux install script created by me, Jerms
#and is intended for my machine only. Please feel free to
#modify this script to your liking
#
#Please read the README.md for documentation
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

echo -e "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo -e "                                                     \e[34m _       ()\e[0m    " 
echo -e "                                                     \e[34m((omputer||erms\e[0m"
echo -e "                                                     \e[34m        [_|\e[0m    "
echo -e "  __   ____   ___  _  _    __    __  __ _  _  _  _  _                       "
echo -e " / _\ (  _ \ / __)/ )( \  (  )  (  )(  ( \/ )( \( \/ )                      "
echo -e "/    \ )   /( (__ ) __ (  / (_/\ )( /    /) \/ ( )  (                       "
echo -e "\_/\_/(__\_) \___)\_)(_/  \____/(__)\_)__)\____/(_/\_)                      "
echo -e " __  __ _  ____  ____  __   __    __      ____   ___  ____  __  ____  ____  "
echo -e "(  )(  ( \/ ___)(_  _)/ _\ (  )  (  )    / ___) / __)(  _ \(  )(  _ \(_  _) "
echo -e " )( /    /\___ \  )( /    \/ (_/\/ (_/\  \___ \( (__  )   / )(  ) __/  )(   "
echo -e "(__)\_)__)(____/ (__)\_/\_/\____/\____/  (____/ \___)(__\_)(__)(__)   (__)  "
echo -e "                                                                            "
echo -e "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

#echo -e "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo -e "\e[31mThis is an Arch Linux install script created by me, Jerms\e[0m"
echo -e "\e[31mand is intended for my machine only. Please feel free to\e[0m"
echo -e "\e[31mmodify this script to your liking\e[0m"
echo -e "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

#echo -e "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo -e "\e[36mpreinstall.sh = Arch ISO from USB\e[0m"
echo -e "\e[36minstall.sh = After first reboot, still in terminal\e[0m"
echo -e "\e[36mpostinstall.sh = use in graphical environment\e[0m"
echo -e "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

#~~~~~~~Script-Directory~~~~~~~~~~~~~~~~~~~~~
SRCDIR=$PWD

#~~~~~~~Yes/No-Preinstall-Function~~~~~~~~~~~
function preinstall_script {
read -r -p "Are You Sure? [Y/n] " input

case $input in
    [yY][eE][sS]|[yY])
$SRCDIR/resources/0-preinstall.sh
 ;;
    [nN][oO]|[nN])
 echo "Aborting Arch Linux Install Script"
       ;;
    *)
 echo "Invalid input..."
 exit 1
 ;;
esac
}

#~~~~~~~Yes/No-Install-Function~~~~~~~~~~~~~~
function install_script {
read -r -p "Are You Sure? [Y/n] " input

case $input in
    [yY][eE][sS]|[yY])
$SRCDIR/resources/1-install.sh
 ;;
    [nN][oO]|[nN])
 echo "Aborting Arch Linux Install Script"
       ;;
    *)
 echo "Invalid input..."
 exit 1
 ;;
esac
}

#~~~~~~~Yes/No-Postinstall-Function~~~~~~~~~~
function postinstall_script {
read -r -p "Install postinstall.sh?? [Y/n] " input

case $input in
    [yY][eE][sS]|[yY])
$SRCDIR/resources/2-postinstall.sh
 ;;
    [nN][oO]|[nN])
 echo "Aborting Arch Linux Install Script"
       ;;
    *)
 echo "Invalid input..."
 exit 1
 ;;
esac
}

#~~~~~~~Selection-Function~~~~~~~~~~~~~~~~~~~
function selectoptions {
PS3='Please enter your choice: '
options=("preinstall.sh" "install.sh" "postinstall.sh" "Quit")
select opt in "${options[@]}"
do
    case $opt in
	    "preinstall.sh")
            echo -e "\e[1;33;4;44myou chose choice 0-preinstall.sh\e[0m"
            preinstall_script
            break
            ;;
            "install.sh")
            echo -e "\e[1;33;4;44myou chose choice 1-install.sh\e[0m"
            install_script
            break
            ;;
            "postinstall.sh")
            echo -e "\e[1;33;4;44myou chose choice 2-postinstall.sh\e[0m"
            postinstall_script
            break
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
}

#~~~~~~~Ececute~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
selectoptions
