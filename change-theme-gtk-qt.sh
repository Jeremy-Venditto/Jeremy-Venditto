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

function Main {

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
cp ~/github/dotfiles/.gtkrc-2.0_light ~/.gtkrc-2.0 &&
cp ~/github/dotfiles/.config/gtk-3.0/settings.ini_light ~/.config/gtk-3.0/settings.ini && echo 'GTK Theme is now set to Light'
fi
if [[ $GTK_THEME = LIGHT ]]; then
cp ~/github/dotfiles/.gtkrc-2.0_dark ~/.gtkrc-2.0 &&
cp ~/github/dotfiles/.config/gtk-3.0/settings.ini_dark ~/.config/gtk-3.0/settings.ini && echo 'GTK Theme is now set to Dark'
fi
QT5_CURRENT_THEME=$(cat ~/.config/qt5ct/qt5ct.conf | grep color_scheme | cut -d '/' -f6)
if [[ $QT5_CURRENT_THEME = darker.conf ]]; then
cp ~/github/dotfiles/.config/qt5ct/qt5ct.conf_light ~/.config/qt5ct/qt5ct.conf && echo 'QT5 Theme is now set to Light'
fi
if [[ $QT5_CURRENT_THEME = simple.conf ]]; then
cp ~/github/dotfiles/.config/qt5ct/qt5ct.conf_dark ~/.config/qt5ct/qt5ct.conf && echo 'QT5 Theme is now set to Dark'
fi
}

function Xterm {
XTERM_THEME=$(cat .Xresources | grep foreground | cut -d ':' -f2 | cut -d ' ' -f2)
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
         cp ~/github/dotfiles/.gtkrc-2.0_dark ~/.gtkrc-2.0
         cp ~/github/dotfiles/.config/gtk-3.0/settings.ini_dark ~/.config/gtk-3.0/settings.ini
         cp ~/github/dotfiles/.config/qt5ct/qt5ct.conf_dark ~/.config/qt5ct/qt5ct.conf
         exit;;
      h) # Print Help
         HELP_FUNCTION
         exit;;
      l) # Change to Light Mode
         cp ~/github/dotfiles/.gtkrc-2.0_light ~/.gtkrc-2.0
         cp ~/github/dotfiles/.config/gtk-3.0/settings.ini_light ~/.config/gtk-3.0/settings.ini
         cp ~/github/dotfiles/.config/qt5ct/qt5ct.conf_light ~/.config/qt5ct/qt5ct.conf
         exit;;
     \?) # Invalid option
         echo "Error: Invalid option"
         exit;;
   esac
done


## SCRIPT ##

Main
Xterm

