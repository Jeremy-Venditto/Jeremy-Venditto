#!/bin/bash

# My Arch Linux Install

#----------------------------------------------------
function part_1 {

# Initial ISO install.. manual intervention is required for this step as of now

# Check if using EFI Mode
ls /sys/firmware/efi/efivars
if [[ -e "/sys/firmware/efi/efivars" ]]; then
echo "EFI MODE = YES";else
echo "EFI MODE = NO";echo "Exiting script.. please check your settings"
exit 1;fi
# Check if Internet is Up
#ip link && read # add prompt
ping -c 1 -q archlinux.org > /dev/null 2>&1
if [[ $? = 0 ]]; then echo 'Internet = Yes'; else echo 'Internet = No';fi
		#ping -c 3 archlinux.org
		#iplink # if UP okay if DOWN then exit script
		#wifi? #wifi-menu
# Set Network Time Protocol
timedatectl set-ntp true


	#### FIX ME #######################!!!!!

# View disks before modifying them
#lsblk && read
# which device?
#INSTALLDRIVE=/dev/vda
#cfdisk $INSTALLDRIVE
# Create EFI Partition (not mounted)
#USEREFI= input
#mkfs.fat -F32 $USEREFI
# Create Root Partition
#USERROOT = input
#mkfs.ext4 $USERROOT
   # mount root
#mount $USERROOT /mnt
# Create Home Partition
#USERHOME = inpu
   # mount homet
#mkfs.ext4 $USERHOME
#mount $USERROOT /mnt
#mkdir /mnt/home
#mount $USERHOME /mnt/home
# list drives
#lsblk
   #yes/no prompt here
	### END FIX ME #####################!!!!!


# Install System
pacstrap -i /mnt base linux linux-firmware sudo nano curl
# Generate File System Table
genfstab -U -p /mnt >> /mnt/etc/fstab

# Move install file into /mnt
mv arch-install.sh /mnt/
# Chroot into system
arch-chroot /mnt /bin/bash
# Download Install Script
#cd ~/ && curl -O https://raw.githubusercontent.com/Jeremy-Venditto/bash-scripts/main/arch-install.sh
#chmod 711 ~/arch-install.sh && ~/arch-install.sh

# Script is running at this point to finish initial install
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime
hwclock --systohc --utc
USERHOSTNAME=archvm
echo $USERHOSTNAME > /etc/hostname
echo "127.0.1.1 localhost.localdomain $USERHOSTNAME" > /etc/hosts
pacman -Sy
pacman -S networkmanager grub efibootmgr
systemctl enable NetworkManager
echo 'set root password...'
passwd
## EFI
mkdir /boot/efi
mount /dev/vda1 /boot/efi
lsblk # to check if everything is mounted correctly
grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/efi --removable
grub-mkconfig -o /boot/grub/grub.cfg
umount -R /mnt
reboot
#}

#----------------------------------------------------
#function part_3 {
# Add user, enable sudo privledges and reboot

	## SWAPFILE
#allocate -l 3G /swapfile
#chmod 600 /swapfile
#mkswap /swapfile
#swapon /swapfile
#echo '/swapfile none swap sw 0 0' >> /etc/fstab
#free -m

## USER
USERUSERNAME="arch-user"
useradd -m -g users -G wheel -s /bin/bash $USERUSERNAME
passwd $USERUSERNAME

#EDITOR=nano visudo
sudo sed -i 's!# %wheel ALL=(ALL) ALL!%wheel ALL=(ALL:ALL) ALL!'
reboot
}

#----------------------------------------------------
function part_4 {
#Install Everything else


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

# Install git and build tools
sudo pacman -S git autoconf make gcc perl fakeroot automake

# Make folder named jeremy-venditto in the home folder
mkdir -p ~/jeremy-venditto && cd ~/jeremy-venditto

# Clone repos
git clone https://github.com/jeremy-venditto/bash-scripts
git clone https://github.com/jeremy-venditto/dotfiles
git clone https://github.com/jeremy-venditto/wallpaper

			##################
			#### PACKAGES ####
			##################

## Enable Multilib repository
sudo sed -i '94s!#Include = /etc/pacman.d/mirrorlist!Include = /etc/pacman.d/mirrorlist!' /etc/pacman.conf
sudo pacman -Syyu
## Get Fastest Mirrors
sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist
## Install Packages
	#Packages for all machine types
#sudo pacman -S - < ~/jeremy-venditto/dotfiles/.resources/NEW_pacman_full
sudo pacman -S lightdm lightdm-gtk-greeter-settings xorg awesome xterm terminator exa ufw firefox
        #Install yay AUR helper
git clone https://aur.archlinux.org/yay
cd yay && makepkg -si
        #Install machine specific packages
if [[ $MACHINE = "DESKTOP" ]]; then sudo pacman -S - < ~/jeremy-venditto/dotfiles/.resources/pacman_desktop.txt && yay -S - < ~/jeremy-venditto/dotfiles/.resources/aur_desktop.txt;fi
if [[ $MACHINE = "LAPTOP" ]]; then sudo pacman -S - < ~/jeremy-venditto/dotfiles/.resources/pacman_laptop.txt && yay -S - < ~/jeremy-venditto/dotfiles/.resources/aur_laptop.txt;fi
if [[ $MACHINE = "VIRTUAL" ]]; then sudo pacman -S - < ~/jeremy-venditto/dotfiles/.resources/pacman_vm.txt && yay -S - < ~/jeremy-venditto/dotfiles/.resources/aur_vm.txt;fi


			###################
			### EDIT CONFIG ###
			###################

# Move config files
    #files
mv ~/jeremy-venditto/dotfiles/.bash_profile /~
mv ~/jeremy-venditto/dotfiles/.bashrc ~/
mv ~/jeremy-venditto/dotfiles/.profile ~/
mv ~/jeremy-venditto/dotfiles/.xinitrc ~/
mv ~/jeremy-venditto/dotfiles/.xprofile ~/
sudo mv ~/jeremy-venditto/dotfiles/usr/share/pixmaps/* /usr/share/pixmaps/
    #directories
mv ~/jeremy-venditto/dotfiles/.config/ ~/
mv ~/jeremy-venditto/dotfiles/.local/ ~/
    #wallpaper directory? default is ~/
mv ~/jeremy-venditto/wallpaper/ ~/

## Screen Resolution for virtual machines
if [[ $MACHINE = VIRTUAL ]]; then
echo "xrandr --output Virtual-1 --primary --mode 1024x768 --rate 60" > ~/screen-normal.sh
echo "xrandr --output Virtual-1 --primary --mode 1920x1080 --rate 60" > ~/screen-full.sh
chmod +x ~/screen-normal.sh ~/screen-full.sh;fi

		# Services

# Enable UFW firewall
sudo ufw enable && sudo systemctl enable --now ufw

# Enable LightDM
sudo systemctl enable lightdm

# Change LightDM settings
if [[ $MACHINE = DESKTOP ]]; then sudo cp ~/jeremy-venditto/dotfiles/etc/lightdm/lightdm-gtk-greeter.conf_desktop /etc/lightdm/lightdm-gtk-greeter.conf;fi
if [[ $MACHINE = LAPTOP ]]; then sudo cp ~/jeremy-venditto/dotfiles/etc/lightdm/lightdm-gtk-greeter.conf_laptop /etc/lightdm/lightdm-gtk-greeter.conf;fi
if [[ $MACHINE = VIRTUAL ]]; then sudo cp ~/jeremy-venditto/dotfiles/etc/lightdm/lightdm-gtk-greeter.conf_vm /etc/lightdm/lightdm-gtk-greeter.conf;fi

# Change Nitrogen Settings
if [[ $MACHINE = DESKTOP ]]; then sed -i "/DIRS=/c\DIRS=/home/"$USER"/files/wallpaper/1920x1080" ~/.config/nitrogen/nitrogen.cfg;fi
if [[ $MACHINE = LAPTOP ]]; then sed -i "/DIRS=/c\DIRS=/home/"$USER"/files/wallpaper/1920x1080" ~/.config/nitrogen/nitrogen.cfg;fi
if [[ $MACHINE = VIRTUAL ]]; then sed -i "/DIRS=/c\DIRS=/home/"$USER"/wallpaper/1920x1080" ~/.config/nitrogen/nitrogen.cfg;fi

# Change Grub Wallpaper
sudo sed -i "/#GRUB_BACKGROUND=/c\GRUB_BACKGROUND=/home/"$USER"/wallpaper/grub/004-1024x768" /etc/default/grub

# Enable nano syntax highlighting
~/jeremy-venditto/bash-scripts/nano-syntax-highlighting.sh

### install dmenu
cd ~/.config/dmenu && sudo make install

echo 'script complete'
}

						#~~~############~~~#
						#~~ SCRIPT START ~~#
						#~~~############~~~#
### MAIN PROMPT ####
PS3='Please enter your choice: '
options=("Part 1" "Part 2" "Part 3" "Part 4" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Part 1")
            part_1
            break
            ;;
        "Part 2")
            part_2
            break
            ;;
        "Part 3")
            part_3
            break
            ;;
        "Part 4")
            part_4
#            rm -rf ~/jeremy-venditto
            break
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done





#### TO DO #####
# Make rc.lua_virtual
# Make /etc/lightdm/lightdm.conf_virtual
# Make wallpaper directory switcher script
# Make xrandr script or something idk maybe .bashr
