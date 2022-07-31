#!/bin/bash

#     __                         _   __            ___ __  __
# __ / /__ _______ __ _  __ __  | | / /__ ___  ___/ (_) /_/ /____
#/ // / -_) __/ -_)  ' \/ // /  | |/ / -_) _ \/ _  / / __/ __/ _ \
#\___/\__/_/  \__/_/_/_/\_, /   |___/\__/_//_/\_,_/_/\__/\__/\___/
#                      /___/

#Jeremy Venditto
#https://github.com/jeremy-venditto
#https://jeremyvenditto.info

# Dark / Light mode switcher
# for GTK-2.0, GTK-3.0, and QT5 applications

# Required for this config:
# adwaita adwaida-dark obsidian-icons-red kanada-cursors papirus-icons
# i will add links here later

#md5sums
 # gtk 2
#c1c6d014f7b058bfbe951b2f6750d3b2  gtkrc-2.0_dark
#e2991a83c7f5bd426baf20488fd8257c  gtkrc-2.0_light
 # gtk 3
#f70e9c707bb04409181a203456f94c72  settings.ini_dark
#6961a11d537725307fd7ea8bce05919b  settings.ini_light
 # .xresources
#9683a96313de0fad9851a5074618b7dc  Xresources-dark
#9d90a6f112a2d07e865a7bb175ac4eeb  Xresources-light
 # qt5
#490d1ff5097b69b9125002840f3e3c91  qt5ct.conf_dark
#30a772f38d2ce04bd31f328afbbf4289  qt5ct.conf_light

#gtk3sum
#gtk3sum
#qt5ctsum_sum
#xresources_sum

function Main {

if [[ -e "$HOME/.config/gtk-2.0/gtkrc-2.0_light" ]]; then
  echo "file exists" > /dev/null;else
echo "~/.config/gtk-2.0/gtkrc-2.0_light does not exist, downloading file"
curl -O https://raw.githubusercontent.com/jeremy-venditto/dotfiles/main/.config/gtk-2.0/gtkrc-2.0_light
mv gtkrc-2.0_light ~/.config/gtk-2.0/
fi

if [[ -e "$HOME/.config/gtk-2.0/gtkrc-2.0_dark" ]]; then
  echo "file exists" > /dev/null;else
echo "~/.config/gtk-2.0/gtkrc-2.0_dark does not exist, downloading file"
curl -O https://raw.githubusercontent.com/jeremy-venditto/dotfiles/main/.config/gtk-2.0/gtkrc-2.0_dark
mv gtkrc-2.0_dark ~/.config/gtk-2.0/
fi

if [[ -e "$HOME/.config/gtk-3.0/settings.ini_dark" ]]; then
  echo "file exists" > /dev/null;else
echo "~/.config/gtk-3.0/settings.ini_dark does not exist, downloading file"
curl -O https://raw.githubusercontent.com/jeremy-venditto/dotfiles/main/.config/gtk-3.0/settings.ini_dark
mv settings.ini_dark ~/.config/gtk-3.0/
fi

if [[ -e "$HOME/.config/gtk-3.0/settings.ini_light" ]]; then
  echo "file exists" > /dev/null;else
echo "~/.config/gtk-3.0/settings.ini_light does not exist, downloading file"
curl -O https://raw.githubusercontent.com/jeremy-venditto/dotfiles/main/.config/gtk-3.0/settings.ini_light
mv settings.ini_light ~/.config/gtk-3.0/
fi

if [[ -e "$HOME/.config/qt5ct/qt5ct.conf_dark" ]]; then
  echo "file exists" > /dev/null;else
echo "~/.config/qt5ct/qt5ct.conf_dark does not exist, downloading file"
curl -O https://raw.githubusercontent.com/jeremy-venditto/dotfiles/main/.config/qt5ct/qt5ct.conf_dark
mv qt5ct.conf_dark ~/.config/qt5ct/
fi

if [[ -e "$HOME/.config/qt5ct/qt5ct.conf_light" ]]; then
  echo "file exists" > /dev/null;else
echo "~/.config/qt5ct/qt5ct.conf_light does not exist, downloading file"
curl -O https://raw.githubusercontent.com/jeremy-venditto/dotfiles/main/.config/qt5ct/qt5ct.conf_light
mv qt5ct.conf_light ~/.config/qt5ct/
fi

GTK_CURRENT_THEME=$(cat ~/.gtkrc-2.0 | grep gtk-theme-name | cut -d '"' -f2)
if [[ $GTK_CURRENT_THEME = Adwaita-Dark ]]; then GTK_THEME=DARK;fi
if [[ $GTK_CURRENT_THEME = Adwaita ]]; then GTK_THEME=LIGHT;fi
if [[ $GTK_THEME = DARK ]]; then
cp ~/.config/gtk-2.0/gtkrc-2.0_light ~/.gtkrc-2.0 &&
cp ~/.config/gtk-3.0/settings.ini_light ~/.config/gtk-3.0/settings.ini && echo 'GTK Theme is now set to Light'
fi
if [[ $GTK_THEME = LIGHT ]]; then
cp ~/.config/gtk-2.0/gtkrc-2.0_dark ~/.gtkrc-2.0 &&
cp ~/.config/gtk-3.0/settings.ini_dark ~/.config/gtk-3.0/settings.ini && echo 'GTK Theme is now set to Dark'
fi
QT5_CURRENT_THEME=$(cat ~/.config/qt5ct/qt5ct.conf | grep color_scheme | cut -d '/' -f6)
if [[ $QT5_CURRENT_THEME = darker.conf ]]; then
cp ~/.config/qt5ct/qt5ct.conf_light ~/.config/qt5ct/qt5ct.conf && echo 'QT5 Theme is now set to Light'
fi
if [[ $QT5_CURRENT_THEME = simple.conf ]]; then
cp ~/.config/qt5ct/qt5ct.conf_dark ~/.config/qt5ct/qt5ct.conf && echo 'QT5 Theme is now set to Dark'
fi
}

function Xterm {
XTERM_THEME=$(cat ~/.Xresources | grep foreground | cut -d ':' -f2 | cut -d ' ' -f2)
if [[ $XTERM_THEME = black ]]; then cp ~/.config/xterm/Xreources-light ~/.Xresources;fi
if [[ $XTERM_THEME = white ]]; then cp ~/.config/xterm/Xreources-dark ~/.Xresources;fi
xrdb ~/.Xresources
}

function HELP_FUNCTION {
   # Display Help
   echo
   echo -e ${cyan}"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"${reset}
   echo
   echo -e ${yellow}"                  \e[1mHelp Screen for change-theme-gtk-qt.sh\e[0m"${reset}
   echo
   echo "Syntax: [ |-d|-h|-l| ]"
   echo
   echo -e ${green}"Option:    Description:"${reset}
   echo
   echo "-d  ~~~~~  Change to Dark Mode"
   echo "-h  ~~~~~  Print this help and exit"
   echo "-l  ~~~~~  Change to Light Mode"
   echo
   echo -e ${cyan}"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"${reset}
}

################################# Flag options #################################
# Get the options
while getopts ":dhl" option; do
   case $option in
      d) # Change to Dark Mode
         cp ~/.config/gtk-2.0/gtkrc-2.0_dark ~/.gtkrc-2.0
         cp ~/.config/gtk-3.0/settings.ini_dark ~/.config/gtk-3.0/settings.ini
         cp ~/.config/qt5ct/qt5ct.conf_dark ~/.config/qt5ct/qt5ct.conf
         cp ~/.config/xterm/Xreources-light ~/.Xresources
         exit;;
      h) # Print Help
         HELP_FUNCTION
         exit;;
      l) # Change to Light Mode
         cp ~/.config/gtk-2.0/gtkrc-2.0_light ~/.gtkrc-2.0
         cp ~/.config/gtk-3.0/settings.ini_light ~/.config/gtk-3.0/settings.ini
         cp ~/.config/qt5ct/qt5ct.conf_light ~/.config/qt5ct/qt5ct.conf
         cp ~/.config/xterm/Xreources-light ~/.Xresources
exit;;
     \?) # Invalid option
         echo "Error: Invalid option"
         exit;;
   esac
done


## SCRIPT ##

Main
Xterm

