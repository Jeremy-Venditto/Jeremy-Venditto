#!/bin/bash

# My Arch Linux Install

			##############
			### PROMPT ###
			##############

PS3='Please enter your choice: '
options=("Laptop" "Desktop" "Virtual Machine" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Laptop")
	    MACHINE="LAPTOP"
            break
            ;;
        "Desktop")
	    MACHINE="DESKTOP"
            break
            ;;
        "Virtual Machine")
	    MACHINE="VIRTUAL"
            break
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

			##################
			### ESSENTIALS ###
			##################

# Install Git
sudo pacman -S git
# Make folder named jeremy-venditto in the home folder
mkdir -p ~/jeremy-venditto && cd ~/jeremy-venditto
# Clone repos
git clone https://github.com/jeremy-venditto/bash-scripts
git clone https://github.com/jeremy-venditto/dotfiles
git clone https://github.com/jeremy-venditto/wallpaper

			##################
			#### PACKAGES ####
			##################

function LAPTOP_PACKAGES {
sudo pacman -S - < ~/jeremy-venditto/dotfiles/.resources/pacman_laptop.txt
#sudo pacman -S - < ~/jeremy-venditto/dotfiles/.resources/aur_laptop.txt
git clone https://aur.archlinux.org/yay
cd yay && makepkg -si
yay -S - < ~/jeremy-venditto/dotfiles/.resources/aur_laptop.txt
}

function DESKTOP_PACKAGES {
sudo pacman -S - < ~/jeremy-venditto/dotfiles/.resources/pacman_desktop.txt
#sudo pacman -S - < ~/jeremy-venditto/dotfiles/.resources/aur_desktop.txt
git clone https://aur.archlinux.org/yay
cd yay && makepkg -si
yay -S - < ~/jeremy-venditto/dotfiles/.resources/aur_desktop.txt
}

function VIRTUAL_PACKAGES {
sudo pacman -S - < ~/jeremy-venditto/dotfiles/.resources/pacman.txt
sudo pacman -S - < ~/jeremy-venditto/dotfiles/.resources/vm-only.txt
git clone https://aur.archlinux.org/yay
cd yay && makepkg -si
yay -S - < ~/jeremy-venditto/dotfiles/.resources/aur-vm.txt
}

	### INTSALL PACKAGES ###
#sudo pacman -S autoconf make gcc perl fakeroot automake
#sudo pacman -S --needed $(comm -12 <(pacman -Slq | sort) <(sort ~/jeremy-venditto/dotfiles/.resources/packages/all.txt))
if [[ $MACHINE = "DESKTOP" ]]; then DESKTOP_PACKAGES;fi
if [[ $MACHINE = "LAPTOP" ]]; then LAPTOP_PACKAGES;fi
if [[ $MACHINE = "VIRTUAL" ]]; then VIRTUAL_PACKAGES;fi


### install dmenu
cd ~/.config/dmenu && sudo make install

			###################
			### EDIT CONFIG ###
			###################

## Screen Resolution
echo "xrandr --output Virtual-1 --primary --mode 1024x768 --rate 60" > ~/jeremy-venditto/screen-normal.sh
echo "xrandr --output Virtual-1 --primary --mode 1920x1080 --rate 60" > ~/jeremy-venditto/screen-full.sh
chmod +x ~/jeremy-venditto/screen*

# Change Nitrogen Settings
if [[ $MACHINE = DESKTOP ]]; then echo 'soon';fi
if [[ $MACHINE = LAPTOP ]]; then echo 'soon';fi
if [[ $MACHINE = VIRTUAL ]]; then sed -i "/DIRS=/c\DIRS=/home/"$USER"/wallpaper/1920x1080" ~/.config/nitrogen/nitrogen.cfg;fi

# Change LightDM settings
if [[ $MACHINE = DESKTOP ]]; then echo 'soon';fi
if [[ $MACHINE = LAPTOP ]]; then echo 'soon';fi
if [[ $MACHINE = VIRTUAL ]]; then sudo cp ~/jeremy-venditto/dotfiles/etc/lightdm/lightdm-gtk-greeter.conf_laptop /etc/lightdm/lightdm/lightdm-gtk-greeter.conf

# Change Grub Wallpaper
sudo sed -i "/#GRUB_BACKGROUND=/c\GRUB_BACKGROUND=/home/"$USER"/wallpaper/grub/004-1024x768" /etc/default/grub

# Enable nano syntax highlighting
~/jeremy-venditto/nano-syntax-highlighting.sh

# Move config files
  #files
mv ~/jeremy-venditto/dotfiles/.bash_profile /~
mv ~/jeremy-venditto/dotfiles/.bashrc ~/
mv ~/jeremy-venditto/dotfiles/.profile ~/
mv ~/jeremy-venditto/dotfiles/.xinitrc ~/
mv ~/jeremy-venditto/dotfiles/.xprofile ~/
#echo "Sudo required for moving files to /usr/share/pixmaps/"
sudo mv ~/jeremy-venditto/dotfiles/usr/share/pixmaps/* /usr/share/pixmaps/
  #directories
mv ~/jeremy-venditto/dotfiles/.config/ ~/
mv ~/jeremy-venditto/dotfiles/.local/ ~/
    #wallpaper
    #wallpaper directory? default is ~/
mv ~/jeremy-venditto/wallpaper/ ~/

#### TO DO #####
# Make rc.lua_virtual
# Make /etc/lightdm/lightdm.conf_virtual
# Make wallpaper directory switcher script
# Make xrandr script or something idk maybe .bashr
