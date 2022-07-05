#!/bin/bash

#     __                         _   __            ___ __  __
# __ / /__ _______ __ _  __ __  | | / /__ ___  ___/ (_) /_/ /____
#/ // / -_) __/ -_)  ' \/ // /  | |/ / -_) _ \/ _  / / __/ __/ _ \
#\___/\__/_/  \__/_/_/_/\_, /   |___/\__/_//_/\_,_/_/\__/\__/\___/
#                      /___/

#Jeremy Venditto
#https://github.com/jeremy-venditto
#https://jeremyvenditto.info

# required packages

#define colors
cyan="\e[0;96m"
magenta="\e[0;95m"
yellow="\e[0;93m"
bold="\e[1m"
reset="\e[0m"
clear;echo 'Create Bootable USB using the dd command:';echo;
# Get File
echo -e "${magenta}~~~~~~~~${reset}${bold} Potential Files ${reset}${magenta}~~~~~~~~~~~~~~~~~"${reset}
echo -e "$HOME/Downloads/"${cyan}; ls ~/Downloads | grep .iso | grep -v .sig | grep -v .torrent; ls ~/Downloads > /dev/null 2>&1 | grep .img | grep -v .xz
echo -e ${reset}"$HOME/downloads/"${cyan};ls ~/downloads | grep .iso | grep -v .sig | grep -v .torrent; ls ~/downloads | grep .img | grep -v .xz
echo -e ${reset}"$HOME/"${cyan}; ls ~ | grep .iso | grep -v .sig | grep -v .torrent; ls ~/ | grep .img | grep -v .xz
echo -e ${magenta}"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~";echo -e ${yellow}"What is the file you would like to use?"${reset}
read -rp "" -e -i "$HOME/" FILE
# Get Device
echo;lsblk -f;echo;echo -e ${yellow}"What is the device you wish to burn the bootable ISO file to?"${reset}
read -rp "" -e -i "/dev/" DEVICE;echo
# Confirmation Prompt
echo -e "${bold}Write file ${reset}${cyan}$FILE${reset}${bold} to device ${reset}${cyan}$DEVICE${reset}${bold}"?"${reset}"
read -r -p "Are You Sure? [Y/n] " input ; case $input in
	# Execute Command
    [yY][eE][sS]|[yY]) sudo dd if=$FILE of=$DEVICE bs=1M status=progress ;;
#    [yY][eE][sS]|[yY]) echo 'dd..ing' ;;
    [nN][oO]|[nN]) exit 1 ;; *) echo "Invalid input...";;esac
