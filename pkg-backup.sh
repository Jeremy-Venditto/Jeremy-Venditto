#!/bin/bash

#     __                         _   __            ___ __  __
# __ / /__ _______ __ _  __ __  | | / /__ ___  ___/ (_) /_/ /____
#/ // / -_) __/ -_)  ' \/ // /  | |/ / -_) _ \/ _  / / __/ __/ _ \
#\___/\__/_/  \__/_/_/_/\_, /   |___/\__/_//_/\_,_/_/\__/\__/\___/
#                      /___/

#Jeremy Venditto
#https://github.com/jeremy-venditto
#https://jeremyvenditto.info

# Backs up user installed packages on any system

green="\e[0;92m"
yellow="\e[0;93m"
reset="\e[0m"

# Check for Snaps
# Check for Flatpaks
# Check for Appimages

# Arch
function ARCH_PKG {
  # Get Distro Name
NAME=$(cat /etc/issue | grep r | cut -d ' ' -f 1)
  # Create directory ~/packages-backup. Sort Foreign (AUR) packages and User Installed Pacages (Pacman)
mkdir -p ~/packages-backup && pacman -Qqm > ~/packages-backup/"${NAME}"_AUR.txt && pacman -Qqe > ~/packages-backup/"${NAME}"_PACMAN_RAW.txt
  # Removes AUR programs from the list of User Installed Packages
grep -v -f ~/packages-backup/"${NAME}"_AUR.txt ~/packages-backup/"${NAME}"_PACMAN_RAW.txt > ~/packages-backup/"${NAME}"_Pacman.txt
  # Remove Temporary File
rm ~/packages-backup/"${NAME}"_PACMAN_RAW.txt && echo -e "${green}Packages have been backed up to${reset} ${yellow}~/packages-backup${reset}"
}

# Debian
#function DEBIAN_PKG {
#echo 'soon'
#}


LINUX_DISTRO=$(cat /etc/os-release | grep -e NAME | grep -v PRETTY | sed -e 's/^......//' -e 's/.$//')
if [[ $LINUX_DISTRO = "Arch Linux" ]]; then ARCH_PKG;fi
if [[ $LINUX_DISTRO = "Debian" ]]; then DEBIAN_PKG;fi
