#!/bin/bash

#     __                         _   __            ___ __  __
# __ / /__ _______ __ _  __ __  | | / /__ ___  ___/ (_) /_/ /____
#/ // / -_) __/ -_)  ' \/ // /  | |/ / -_) _ \/ _  / / __/ __/ _ \
#\___/\__/_/  \__/_/_/_/\_, /   |___/\__/_//_/\_,_/_/\__/\__/\___/
#                      /___/

#Jeremy Venditto
#https://github.com/jeremy-venditto
#https://jeremyvenditto.info

# My Arch Linux Install
#----------------------------------------------------
        #####################
        ### Define Colors ###
        #####################

red="\e[0;91m"
blue="\e[0;94m"
cyan="\e[0;96m"
magenta="\e[0;95m"
expand_bg="\e[K"
blue_bg="\e[0;104m${expand_bg}"
red_bg="\e[0;101m${expand_bg}"
green_bg="\e[0;102m${expand_bg}"
green="\e[0;92m"
white="\e[0;97m"
yellow="\e[0;93m"
bold="\e[1m"
uline="\e[4m"
reset="\e[0m"

	#########################
	### Script Automation ###
	#########################

function AUTOMATED_ALL {
read -r -p "Automate Script? [Y/n] " input ; case $input in
    [yY][eE][sS]|[yY]) AUTOMATED=YES ;;
    [nN][oO]|[nN]) AUTOMATED=NO      ;; *) echo "Invalid input...";exit 1;;esac
}
function AUTOMATED_DESKTOP {
echo 'hi'
}
function AUTOMATED_LAPTOP {
echo 'hi'
}
function AUTOMATED_VM {
cat ~/jeremy-venditto/automated_vm.txt << 'EOF'
y
n
n
y
y
n
EOF
~/jeremy-venditto/automated_vm.txt | ~/jeremy-venditto/arch-install.sh
#automated answers
#printf '%s\n' y | arch-install.sh
}


function DISKS_PARTITIONS {

# View Disks before modifying
lsblk
#echo -e ${yellow};lsblk;
#echo -e ${reset}

# Select Installation Hard Disk
read -rp "INSTALL DRIVE: " -e -i /dev/ INSTALL_DRIVE
#cfdisk $INSTALL_DRIVE

read -r -p "Coninue with disk formatting? [Y/n] " input ; case $input in
    [yY][eE][sS]|[yY])

# Partition Drive (manual as of now)
cfdisk $INSTALL_DRIVE # Make this automated



# Create EFI Partition (not mounted)
read -rp "EFI PARTITION: " -e -i /dev/ EFI_PART
echo $EFI_PART > efi.txt # EFI_PART variable is lost after arch-chroot
mkfs.fat -F32 -f $EFI_PART > /dev/null
echo -e ${cyan}"EFI Partition created on $EFI_PART"${reset}
mount --mkdir $EFI_PART /mnt/boot/efi

# Create Swap Partition
read -rp "SWAP PARTITION: " -e -i /dev/ SWAP_PART
echo $SWAP_PART > swap.txt # SWAP_PART variable is lost after arch-chroot
mkswap $SWAP_PART && swapon $SWAP_PART
if [[ -z $SWAP_PART ]]; then echo "SWAP file set up on (edit me)"; else echo -e ${cyan}"SWAP space set up on $SWAP_PART"${reset};fi
        ## SWAPFILE
#allocate -l 3G /swapfile
#chmod 600 /swapfile
#mkswap /swapfile
#swapon /swapfile
#echo '/swapfile none swap sw 0 0' >> /etc/fstab
#free -m


# Create Root Partition mounted to /mnt
read -rp "ROOT PARTITION: " -e -i /dev/ ROOT_PART
mkfs.ext4 -f $ROOT_PART
mount $ROOT_PART /mnt > /dev/null
echo -e ${cyan}"Root Partition created and mounted on $ROOT_PART"${reset}

# Create Home Partition mounted to /mnt/home
read -rp "HOME PARTITION: " -e -i /dev/ HOME_PART
mkfs.ext4 -f $HOME_PART
 mkdir -p /mnt/home
mount $HOME_PART /mnt/home > /dev/null
echo -e ${cyan}"Home Partition created and mounted on $HOME_PART"${reset}


# Assign Computer Hostname to system
#read -rp "Machine Hostname: " HOSTNAME
#echo $HOSTNAME > hostname.txt


echo
echo -e ${yellow} "Install Drive: $INSTALL_DRIVE"${reset}
echo -e ${yellow} "EFI Partiton: $EFI_PART"${reset}
echo -e ${yellow} "SWAP Partition: $SWAP_PART"${reset}
echo -e ${yellow} "Root Partition: $ROOT_PART"${reset}
echo -e ${yellow} "Home Partition: $HOME_PART"${reset}
#echo "Hostname: $HOSTNAME"
;;
    [nN][oO]|[nN]) echo "No"      ;; *) echo "Invalid input...";exit 1;;esac

}



        ###############################################
        ### Arch ISO environment before arch-chroot ###
        ###############################################

function ARCH_ISO {

# Initial ISO install.. manual intervention is required for this step as of now

# Check if using EFI Mode
echo -e ${yellow}'Checking if system is booted in EFI mode'${reset}
ls /sys/firmware/efi/efivars
if [[ -e "/sys/firmware/efi/efivars" ]]; then
echo -e ${cyan}"EFI MODE = YES"$Preset};else
echo -e ${cyan}"EFI MODE = NO"${reset} && echo -e ${red}"Exiting script.. please check your settings"${reset}
exit 1;fi

# Check Internet Connection
#ip link && read # add prompt
echo 'Checking Internet Connection'
ping -c 1 -q archlinux.org > /dev/null 2>&1
if [[ $? = 0 ]]; then echo -e ${green}'Internet = Yes'${reset}; else echo -e ${red}'Internet = No'${reset};fi
		#ping -c 3 archlinux.org
		#iplink # if UP okay if DOWN then exit script
#MAKE WIFI MENU HERE

		#wifi? #wifi-menu

# Set Network Time Protocol
echo -e ${yellow}'Setting Network Time Protocol'${reset}
timedatectl set-ntp true


# Assign Computer Hostname to system
echo -e ${blue}'Please Choose the Machine Hostname'${reset}
read -rp "Machine Hostname: " HOSTNAME
echo $HOSTNAME > hostname.txt

# Set Disk/Partitions
DISKS_PARTITIONS
echo -e ${green}
read -r -p "Are the Partitions Correct? [Y/n] " input ; case $input in
    [yY][eE][sS]|[yY]) echo -e ${reset} "Yes" > /dev/null ;;
    [nN][oO]|[nN]) DISKS_PARTITIONS ;; *) echo "Invalid input...";exit 1;;esac

# Install System
echo -e ${red}'Installing base system'${reset}
pacstrap /mnt base linux linux-firmware sudo nano curl
echo -e ${green}'System Installed'${reset}

# Generate File System Table
echo -e ${yellow}'Generating File System Table'${reset}
genfstab -U -p /mnt > /mnt/etc/fstab
echo -e ${green}"created /etc/fstab"${reset}

# Move files into /mnt so we can use them later
mv arch-install.sh /mnt/
echo -e ${magenta}"Install Script moved to /mnt"${reset}
# Moving lost user input variables so we can use them again
mv efi.txt /mnt/
mv hostname.txt /mnt/
#mv swap.txt /mnt/

# Chroot into system
echo -e ${cyan}"Chrooting into system"${reset}
arch-chroot /mnt /bin/bash /arch-install.sh -a
}

        #############################################
        ### Arch ISO enviroment after arch-chroot ###
        #############################################

# Chrooting into /mnt stopped the script, so I needed another function

function ISO_AFTER_CHROOT {

#SWAP_PART=$(cat swap.txt)
EFI_PART=$(cat efi.txt)
HOSTNAME=$(cat hostname.txt)
#Chrooting into /mnt stopped the script. so here we are with another function

echo -e ${yellow}'Generating locales'${reset}
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo -e ${green}'locales generated'${reset}
echo -e ${yellow}'Setting Time Zone'${reset}
ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime
hwclock --systohc --utc
echo -e ${green}'Time Zone Configured'${reset}

# Set Hostname
echo -e ${cyan}'Creating Hostname'${reset}
echo $HOSTNAME > /etc/hostname
echo "127.0.1.1 localhost.localdomain $USERHOSTNAME" > /etc/hosts
echo -e ${green}"Hostname set as $USERHOSTNAME"${reset}

# Update and Install NetworkManager, Grub and EfiBootMgr
echo -e ${yellow}'Updating System'${reset}
pacman -Sy
echo -e ${yellow}'Installing NetworkManager Grub and EfiBootMgr'${reset}
pacman -S networkmanager grub efibootmgr --noconfirm
echo -e ${green}'Packages have been installed.'${reset}
systemctl enable NetworkManager
echo -e ${green}'NetworkManager has been enabled'${reset}

# Set Root Password
echo;echo -e ${red}'set root password...'${reset}
passwd

# Create User
echo -e ${cyan}'Creating User'${reset}
USERUSERNAME="arch-user"
useradd -m -g users -G wheel -s /bin/bash $USERUSERNAME
echo;echo -e ${red}'Set User Password'${reset}
passwd $USERUSERNAME
echo -e ${green}'User Creation Complete'${reset}
  # Add user to wheel group for sudo privlidges
  echo - e ${green}'Adding user to wheel group'${green}
  echo "%wheel ALL=(ALL:ALL) ALL" | sudo EDITOR='tee -a' visudo

# EFI
echo -e ${cyan}'Creating EFI partition'${reset}
mkdir /boot/efi
mount $EFI_PART /boot/efi
echo -e ${green}'EFI partition created and mounted on /boot/efi'${reset}

# Configure mkinitcpio again (worked without it on a VM but not on my 2nd laptop)
mkinitcpio -P

# Grub Bootloader
echo -e $Pblue{'Installing grub'${reset}
#grub-install --target=x86_64-efi --efi-directory=/boot/efi --removable && echo 'Grub installed..'
grub-install && echo -e ${green}'Grub Installed'$Preset}
echo -e ${yellow}'Generating Grub Config file'${reset}
grub-mkconfig -o /boot/grub/grub.cfg
echo -e ${green}'Grub Config created'${reset}


# Moving arch-install.sh into new user home directory. Log in as user and run script
	# add cron job here or something to boot script at next login
mv /arch-install.sh /home/$USERUSERNAME/ && chown arch-user /home/arch-user/arch-install.sh
echo
echo -e ${green}'You may now reboot your system'${reset}
echo -e ${red}'Run this script again at next boot'${reset}
}

#----------------------------------------------------
function USERSPACE_SHELL {
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
#	    if [[ $AUTOMATED=YES ]];then AUTOMATED_LAPTOP;fi
            break
            ;;
        "Desktop")
	    MACHINE="DESKTOP"
#           if [[ $AUTOMATED=YES ]];then AUTOMATED_DESKTOP;fi
            break
            ;;
        "Virtual Machine")
	    MACHINE="VIRTUAL"
#           if [[ $AUTOMATED=YES ]];then AUTOMATED_VM;fi
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
echo -e ${yellow}'Installing git and build tools for AUR'${reset}
sudo pacman -S git autoconf make gcc perl fakeroot automake --noconfirm

# Make folder named jeremy-venditto in the home folder
echo -e ${yellow}'Creating folder ~/jeremy-venditto'${reset}
mkdir -p ~/jeremy-venditto && cd ~/jeremy-venditto

# Clone repos
echo -e ${cyan}'Cloning Git Repositories into ~/jeremy-venditto'${reset}
git clone https://github.com/jeremy-venditto/bash-scripts
git clone https://github.com/jeremy-venditto/dotfiles
git clone https://github.com/jeremy-venditto/wallpaper

			##################
			#### PACKAGES ####
			##################

## Enable Multilib repository
echo -e ${yellow}'Enabling Multilib Repository'${reset}
sudo sed -i '94s!#Include = /etc/pacman.d/mirrorlist!Include = /etc/pacman.d/mirrorlist!' /etc/pacman.conf
sudo pacman -Syyu

## Get Fastest Mirrors
echo -e ${cyan}'Setting mirrors to the fastest ones'${reset}
sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist

## Install Packages

	#Packages for all machine types
#sudo pacman -S - < ~/jeremy-venditto/dotfiles/.resources/NEW_pacman_full --noconfirm
echo -e ${yellow}'Installing packages for all machine types'${reset}
sudo pacman -S lightdm lightdm-gtk-greeter-settings xorg awesome xterm terminator exa ufw firefox --noconfirm

        #Install yay AUR helper
echo -e ${yellow}'Installing yay AUR helper'${reset}
git clone https://aur.archlinux.org/yay
cd yay && makepkg -si --noconfirm

        #Install machine specific packages
if [[ $MACHINE = "DESKTOP" ]]; then
echo -e ${yellow}'Installing Desktop Packages'${reset}
sudo pacman -S - < ~/jeremy-venditto/dotfiles/.resources/pacman_desktop.txt --noconfirm
yay -S - < ~/jeremy-venditto/dotfiles/.resources/aur_desktop.txt --noconfirm;fi
if [[ $MACHINE = "LAPTOP" ]]; then
echo -e ${yellow}'Installing Laptop Packages'${reset}
sudo pacman -S - < ~/jeremy-venditto/dotfiles/.resources/pacman_laptop.txt --noconfirm
yay -S - < ~/jeremy-venditto/dotfiles/.resources/aur_laptop.txt --noconfirm;fi
if [[ $MACHINE = "VIRTUAL" ]]; then
echo -e ${yellow}'Installing Virtual Machine Packages'${reset}
sudo pacman -S - < ~/jeremy-venditto/dotfiles/.resources/pacman_vm.txt --noconfirm
yay -S - < ~/jeremy-venditto/dotfiles/.resources/aur_vm.txt --noconfirm;fi


			###################
			### EDIT CONFIG ###
			###################

# Move config files
    #files
echo -e ${cyan}'Copying configuration files'${reset}

echo -e ${yellow}'Updated ~/.bash_profile'${reset}
mv ~/jeremy-venditto/dotfiles/.bash_profile /~
echo -e ${yellow}'Updated ~/.bashrc'${reset}
mv ~/jeremy-venditto/dotfiles/.bashrc ~/
echo -e ${yellow}'Updated ~/.profile'${reset}
mv ~/jeremy-venditto/dotfiles/.profile ~/
echo -e ${yellow}'Updated ~/.xinitrc'${reset}
mv ~/jeremy-venditto/dotfiles/.xinitrc ~/
echo -e ${yellow}'Updated ~/.xprofile'${reset}
mv ~/jeremy-venditto/dotfiles/.xprofile ~/
echo -e ${yellow}'Added files to /usr/share/pixmaps/'${reset}
sudo mv ~/jeremy-venditto/dotfiles/usr/share/pixmaps/* /usr/share/pixmaps/
    #directories
echo -e ${yellow}'Updated ~/.config/'${reset}
mv ~/jeremy-venditto/dotfiles/.config/ ~/
echo -e ${yellow}'Updated ~/.local/'${reset}
mv ~/jeremy-venditto/dotfiles/.local/ ~/
    #wallpaper directory? default is ~/
echo -e ${yellow}'Wallpaper Directory added to ~/wallpaper/'${reset}
mv ~/jeremy-venditto/wallpaper/ ~/

## Screen Resolution for virtual machines
if [[ $MACHINE = VIRTUAL ]]; then
echo -e ${yellow}'Added 2 screen resolution scripts to ~/'${reset}
echo "xrandr --output Virtual-1 --primary --mode 1024x768 --rate 60" > ~/screen-normal.sh
echo "xrandr --output Virtual-1 --primary --mode 1920x1080 --rate 60" > ~/screen-full.sh
chmod +x ~/screen-normal.sh ~/screen-full.sh;fi

		# Services

# Enable UFW firewall
echo -e ${cyan}'Enabling UFW Firewall'${reset}
sudo ufw enable && sudo systemctl enable --now ufw

# Enable LightDM
echo -e ${cyan}'Enabling LightDM Display Manager'${reset}
sudo systemctl enable lightdm


# Change LightDM settings
echo -e ${yellow}'LightDM Settings Have Been Updated.'${reset}
if [[ $MACHINE = DESKTOP ]]; then
sudo cp ~/jeremy-venditto/dotfiles/etc/lightdm/lightdm-gtk-greeter.conf_desktop /etc/lightdm/lightdm-gtk-greeter.conf;fi
if [[ $MACHINE = LAPTOP ]]; then
sudo cp ~/jeremy-venditto/dotfiles/etc/lightdm/lightdm-gtk-greeter.conf_laptop /etc/lightdm/lightdm-gtk-greeter.conf;fi
if [[ $MACHINE = VIRTUAL ]]; then
sudo cp ~/jeremy-venditto/dotfiles/etc/lightdm/lightdm-gtk-greeter.conf_vm /etc/lightdm/lightdm-gtk-greeter.conf;fi

# Change Nitrogen Settings
echo -e ${yellow}'Nitrogen Settings Have Been Updated.'${reset}
echo -e ${yellow}'Wallpaper Directory Set to ~/wallpaper/1920x1080.'${reset}

if [[ $MACHINE = DESKTOP ]]; then sed -i "/DIRS=/c\DIRS=/home/"$USER"/files/wallpaper/1920x1080" ~/.config/nitrogen/nitrogen.cfg;fi
if [[ $MACHINE = LAPTOP ]]; then sed -i "/DIRS=/c\DIRS=/home/"$USER"/files/wallpaper/1920x1080" ~/.config/nitrogen/nitrogen.cfg;fi
if [[ $MACHINE = VIRTUAL ]]; then sed -i "/DIRS=/c\DIRS=/home/"$USER"/wallpaper/1920x1080" ~/.config/nitrogen/nitrogen.cfg;fi

# Change Grub Wallpaper
echo -e ${yellow}'GRUB Settings Have Been Updated.'${reset}
#sudo sed -i "/#GRUB_BACKGROUND=/c\GRUB_BACKGROUND=/home/"$USER"/wallpaper/grub/004-1024x768" /etc/default/grub
#sudo cp ~/wallpaper/grub/004-1024-768.png /usr/share/pixmaps/grub.png
sudo cp ~/jeremy-venditto/dotfiles/usr/share/pixmaps/grub.png /usr/share/pixmaps/
sudo sed -i "/#GRUB_BACKGROUND=/c\GRUB_BACKGROUND=/usr/share/pixmaps/grub.png" /etc/default/grub

# Enable nano syntax highlighting
echo -e ${yellow}'Enabled Syntax Highlighting for the Nano Text Editor.'${reset}
~/jeremy-venditto/bash-scripts/nano-syntax-highlighting.sh

### install dmenu
cd ~/.config/dmenu && sudo make install && echo -e ${yellow}'Dmenu Has Been Installed.'${reset}
echo
echo -e ${green}'Script Complete!'${reset}
}



						#~~~############~~~#
						#~~ SCRIPT START ~~#
						#~~~############~~~#



# Flags
while getopts ":a" option; do
   case $option in
      a) # Finish Part 1 script after chroot
         ISO_AFTER_CHROOT
         exit;;
esac
done


# AUTOMATED PROMPT
AUTOMATED_ALL

### MAIN PROMPT ####
PS3='Please enter your choice: '
options=("Arch ISO Environment" "Userspace Shell" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Arch ISO Environment")
            ARCH_ISO
            break
            ;;
        "Userspace Shell")
            USERSPACE_SHELL
            break
            ;;
#        "Part 3")
#            part_3
#            break
#            ;;
#        "Part 4")
#            part_4
#            rm -rf ~/jeremy-venditto
#            break
#            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

#### TO DO #####
# Make wallpaper directory switcher script
# Enable sudo privlidges in tty
