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

# Arch
#function ARCH_PKG {
NAME=$(cat /etc/issue | grep r | cut -d ' ' -f 1)
mkdir -p packages-backup && pacman -Qqm > packages-backup/"${NAME}"_AUR.txt && pacman -Qqe > packages-backup/"${NAME}"_PACMAN.txt
#}
# Debian
#function DEBIAN_PKG {
#echo 'soon'
#}


#LINUX_DISTRO=$(cat /etc/os-release | grep -e NAME | grep -v PRETTY | sed -e 's/^......//' -e 's/.$//')
#if [[ $LINUX_DISTRO = "Arch Linux" ]]; then ARCH_PKG;fi
#if [[ $LINUX_DISTRO = "Debian" ]]; then DEBIAN_PKG;fi
