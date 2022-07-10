#!/bin/bash

#     __                         _   __            ___ __  __
# __ / /__ _______ __ _  __ __  | | / /__ ___  ___/ (_) /_/ /____
#/ // / -_) __/ -_)  ' \/ // /  | |/ / -_) _ \/ _  / / __/ __/ _ \
#\___/\__/_/  \__/_/_/_/\_, /   |___/\__/_//_/\_,_/_/\__/\__/\___/
#                      /___/

#Jeremy Venditto
#https://github.com/jeremy-venditto
#https://jeremyvenditto.info

# Enables sudo on any system

# STILL WORKING ON THIS I KNOW I AM MISSING THINGS

function configure_sudo {
declare -A osInfo;
osInfo[/etc/redhat-release]=yum
osInfo[/etc/arch-release]=pacman
osInfo[/etc/gentoo-release]=emerge
osInfo[/etc/SuSE-release]=zypp
osInfo[/etc/debian_version]=apt-get
for f in ${!osInfo[@]}
do
    if [[ -f $f ]];then
PACKAGE_MANAGER=${osInfo[$f]}
	if [[ $PACKAGE_MANAGER = pacman ]]; then GROUP_="wheel";fi ||
	if [[ $PACKAGE_MANAGER = apt-get ]]; then GROUP_="sudo";fi ||
	if [[ $PACKAGE_MANAGER = yum ]]; then GROUP_="sudo";fi ||
	if [[ $PACKAGE_MANAGER = pacman ]]; then GROUP_="sudo";fi ||
        if [[ $PACKAGE_MANAGER = slackpkg ]]; then GROUP="wheel";fi
    fi
done
GROUP=$GROUP_
        if id -nG "$USER" | grep -qw "$GROUP"; then
        echo -e "\e[32mUser '$USER' belongs already to the group '$GROUP'\e[0m"
        else echo "$USER does not belong to $GROUP .. adding it now";cat >> runasroot.sh<< EOF
        sudo usermod -a -G sudo $USER || echo "please reboot system" || sleep 3 && systemctl reboot
EOF
dpkg -l | grep -qw sudo || echo "sudo is not configured, please enter your root password" && su -c runasroot.sh
        fi
}
configure_sudo
