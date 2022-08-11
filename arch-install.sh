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

#--------------------------------------------------------------------------------------------------#
				#### HOW TO INSTALL ####
				    # 2 part step

#____ From Arch ISO environment

# curl -O https://raw.githubusercontent.com/Jeremy-Venditto/bash-scripts/main/arch-install.sh
# chmod +x arch-install.sh
# ./arch-install.sh

#system will reboot into a minimal user shell environment.. log in with new user..

#____ From Userspace upon reboot

# ./arch-install.sh
# choose options

# OR check out built in options with "./arch-install.sh -h"

# reboot and enjoy your new system

#--------------------------------------------------------------------------------------------------#


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
} # End function AUTOMATED_ALL
function AUTOMATED_DESKTOP {
echo 'hi'
} # End function AUTOMATED_DESKTOP
function AUTOMATED_LAPTOP {
echo 'hi'
} # End function AUTOMATED_LAPTOP
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
} # End function AUTOMATED_VM


function DISKS_PARTITIONS {

# View Disks before modifying
lsblk
#echo -e ${yellow};lsblk;
#echo -e ${reset}

# Select Installation Hard Disk
read -rp "INSTALL DRIVE: " -e -i /dev/ INSTALL_DRIVE
#cfdisk $INSTALL_DRIVE

read -r -p "Edit Disk Partitions? [Y/n] " input ; case $input in
    [yY][eE][sS]|[yY])

# Partition Drive (manual as of now)
cfdisk $INSTALL_DRIVE # Make this automated

# Add automated version here.. have it say yes to this prompt

;;
    [nN][oO]|[nN]) echo "No" > /dev/null ;; *) echo "Invalid input...";exit 1;;esac



# Create EFI Partition (not mounted)
read -rp "EFI PARTITION: " -e -i /dev/ EFI_PART
echo $EFI_PART > efi.txt # EFI_PART variable is lost after arch-chroot
mkfs.fat -F32 $EFI_PART > /dev/null
echo -e ${cyan}"EFI Partition created on $EFI_PART"${reset}
mount --mkdir $EFI_PART /mnt/boot/efi

# Create Swap Partition
read -rp "SWAP PARTITION: " -e -i /dev/ SWAP_PART
#echo $SWAP_PART > swap.txt # SWAP_PART variable is lost after arch-chroot
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
mkfs.ext4 $ROOT_PART
mount $ROOT_PART /mnt > /dev/null
echo -e ${cyan}"Root Partition created and mounted on $ROOT_PART"${reset}

# Create Home Partition mounted to /mnt/home
read -rp "HOME PARTITION: " -e -i /dev/ HOME_PART
mkfs.ext4 $HOME_PART
 mkdir -p /mnt/home
mount $HOME_PART /mnt/home > /dev/null
echo -e ${cyan}"Home Partition created and mounted on $HOME_PART"${reset}


# Assign Computer Hostname to system
#read -rp "Machine Hostname: " HOSTNAME
#echo $HOSTNAME > hostname.txt


echo
echo -e ${yellow}"     Install Drive: $INSTALL_DRIVE"${reset}
echo -e ${yellow}"     EFI Partiton: $EFI_PART"${reset}
echo -e ${yellow}"     SWAP Partition: $SWAP_PART"${reset}
echo -e ${yellow}"     Root Partition: $ROOT_PART"${reset}
echo -e ${yellow}"     Home Partition: $HOME_PART"${reset}
echo
lsblk

#echo "Hostname: $HOSTNAME"
#;;
#    [nN][oO]|[nN]) echo "No"      
#;;
#*) echo "Invalid input...";exit 1;;esac

} # End function DISKS_PARTITIONS



        ###############################################
        ### Arch ISO environment before arch-chroot ###
        ###############################################

function ARCH_ISO {

# Initial ISO install.. manual intervention is required for this step as of now

# Check if using EFI Mode
echo -e ${yellow}'Checking if system is booted in EFI mode'${reset}
#ls /sys/firmware/efi/efivars
if [[ -e "/sys/firmware/efi/efivars" ]]; then
echo -e ${cyan}"EFI MODE = YES"${reset};else
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
sleep 2 # stupid arch iso finishes loading during this point and you cant see this prompt
echo -e ${blue}'Please Choose the Machine Hostname'${reset}
read -rp "Machine Hostname: " HOSTNAME
echo $HOSTNAME > hostname.txt

# Set Disk/Partitions
DISKS_PARTITIONS
echo -e ${green}
read -r -p "Are the Partitions Correct? [Y/n] " input ; case $input in
# I dont think the echo -e reset below does anything.. next output was green'
    [yY][eE][sS]|[yY]) echo -e ${reset} "Yes" > /dev/null ;;
    [nN][oO]|[nN]) DISKS_PARTITIONS ;; *) echo "Invalid input...";exit 1;;esac


# Update Mirrorlist manually
echo 'Server = https://at.arch.mirror.kescher.at/$repo/os/$arch' > /etc/pacman.d/mirrorlist
echo 'Server = https://de.arch.mirror.kescher.at/$repo/os/$arch' >> /etc/pacman.d/mirrorlist
echo 'Server = http://mirror.telepoint.bg/archlinux/$repo/os/$arch' >> /etc/pacman.d/mirrorlist
echo 'Server = https://mirror.telepoint.bg/archlinux/$repo/os/$arch' >> /etc/pacman.d/mirrorlist
echo 'Server = rsync://mirror.telepoint.bg/archlinux/$repo/os/$arch' >> /etc/pacman.d/mirrorlist
echo 'Server = https://archlinux.mailtunnel.eu/$repo/os/$arch' >> /etc/pacman.d/mirrorlist
echo 'Server = http://mirror.lty.me/archlinux/$repo/os/$arch' >> /etc/pacman.d/mirrorlist
echo 'Server = http://mirror.cyberbits.eu/archlinux/$repo/os/$arch' >> /etc/pacman.d/mirrorlist
echo 'Server = https://mirror.cyberbits.eu/archlinux/$repo/os/$arch' >> /etc/pacman.d/mirrorlist
echo 'Server = rsync://rsync.cyberbits.eu/archlinux/$repo/os/$arch' >> /etc/pacman.d/mirrorlist

# Update Mirrorlist automatically
reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist

# Update iso (old iso pgp signature issues)
echo;echo -e ${red}'Updating Archlinux Keyring on Arch ISO'${reset};echo
pacman -Sy
pacman -S archlinux-keyring --noconfirm


# Install System
echo
echo -e ${red}'Installing base system'${reset}
echo
pacstrap /mnt base linux linux-firmware sudo nano curl reflector
echo;echo -e ${green}'System Installed'${reset};echo

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

} # End function ARCH_ISO

        #############################################  ###################################
        ### Arch ISO enviroment after arch-chroot ###  ## (ARCH ISO ENVIRONMENT PART 2) ##
        #############################################  ###################################

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
echo -e ${yellow}'Installing NetworkManager Grub OS-Proberand EfiBootMgr'${reset}
pacman -S networkmanager grub efibootmgr os-prober --noconfirm
echo -e ${green}'Packages have been installed.'${reset}
systemctl enable NetworkManager
echo -e ${green}'NetworkManager has been enabled'${reset}

# Set Root Password
echo;echo -e ${red}'Set Root password...'${reset}
until passwd
do echo 'try again'
done
echo

# Create User
echo -e ${cyan}'Creating User'${reset}${yellow}
function CREATE_USERNAME {
read -rp "Username: " USERUSERNAME
echo;echo -e ${magenta}"Username set as: $USERUSERNAME"${reset}
read -r -p "Correct? [Y/n] " input
 
case $input in
    [yY][eE][sS]|[yY])
useradd -m -g users -G wheel -s /bin/bash $USERUSERNAME
 ;;
    [nN][oO]|[nN])
CREATE_USERNAME
       ;;
    *)
 echo "Invalid input..."
 ;;
esac
}
# run above function
CREATE_USERNAME

echo;echo -e ${red}'Set User Password'${reset}
until passwd $USERUSERNAME
do echo 'try again'
done

echo;echo -e ${green}'User Creation Complete'${reset}
echo
  # Add user to wheel group for sudo privlidges
  echo -e ${yellow}'Adding user to wheel group'${green}
  echo "%wheel ALL=(ALL:ALL) ALL" | sudo EDITOR='tee -a' visudo
  echo
# EFI
echo -e ${cyan}'Creating EFI partition'${reset}
mkdir /boot/efi
mount $EFI_PART /boot/efi > /dev/null 2<&1 # complains about fstab needing updating
echo -e ${green}'EFI partition created and mounted on /boot/efi'${reset}

# Configure mkinitcpio again (worked without it on a VM but not on my 2nd laptop)
echo;echo -e ${yellow}'Reconfiguring initramfs'
mkinitcpio -P

# Grub Bootloader
echo;echo -e ${blue}'Installing grub'${reset};echo
grub-install && echo -e ${green}'Grub Installed'${reset}
echo;echo -e ${yellow}'Generating Grub Configuration file'${reset}
echo;grub-mkconfig -o /boot/grub/grub.cfg
echo;echo -e ${green}'Grub Configuration created'${reset}
# Enable Grub to detect other operating systems
echo;echo -e ${magenta}'Enabling Grub to detect other Operating Systems'${reset}
echo;echo 'GRUB_DISABLE_OS_PROBER=false' | sudo tee -a /etc/default/grub
echo;echo -e ${bold}'Regenerating Grub Configuration'${reset}
grub-mkconfig -o /boot/grub/grub.cfg
echo;echo -e ${green}'Grub Configuration created'${reset}


# Add Microcode for AMD and Intel Processors
CPU_TYPE=$(lscpu | grep Vendor | cut -d : -f 2 | sed 's/ //g')
if [[ $CPU_TYPE = GenuineIntel ]]; then 
sudo pacman -S intel-ucode && echo -e ${magenta}'Installed Intel Microcode'${reset};fi
if [[ $CPU_TYPE = AuthenticAMD ]]; then
sudo pacman -S amd-ucode && echo -e ${magenta}'Installed AMD Microcode'${reset};fi

# Moving arch-install.sh into new user home directory. Log in as user and run script
	# add cron job here or something to boot script at next login
mv /arch-install.sh /home/$USERUSERNAME/ && chown $USERUSERNAME /home/$USERUSERNAME/arch-install.sh
# Clean up
rm /hostname.txt && rm /efi.txt
echo
# Script part 1 complete
echo;echo -e ${green}'You may now reboot your system'${reset}
echo -e ${cyan}'Run this script again at next boot'${reset};echo

} # End function ISO_AFTER_CHROOT

#----------------------------------------------------
function USERSPACE_SHELL {
#Install Everything else

			##############
			### PROMPT ###
			##############

# Prompt to select configuration installation method

function CONFIG_CHOICE {
PS3='Please enter your choice: '
options=("Laptop" "Desktop" "Virtual Machine" "Base-Install" "Quit")
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
        "Base Install")
#            MACHINE="BASE-INSTALL"
# Instal Window Manager or Desktop Environment of choice of Choice
# Install Xorg / Lightdm / Pulseaudio On Window Managers
ARCH_BASE_INSTALL
            break
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

} # End function CONFIG_CHOICE
# Run above function
CONFIG_CHOICE

# Base-Install function
function ARCH_BASE_INSTALL {
PS3='Please enter your choice: '
options=("KDE-Plasma" "MATE" "Awesome WM" "Back" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "KDE-Plasma")
            break
            exit 1
            ;;
        "MATE")
            break
            exit 1
            ;;
        "Awesome WM")
            sudo pacman -S awesome xterm
            break
            exit 1
            ;;
        "Back")
            CONFIG_CHOICE
            break
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

} # End function ARCH_BASE_INSTALL


              ####################
              #### ESSENTIALS ####
              ####################

## Enable Parallel Downloads and Color for Pacman
sudo sed -i '37s!#ParallelDownloads = 5!ParallelDownloads = 5!' /etc/pacman.conf
echo;echo -e ${yellow}'Enabling Parallel Downloads'${reset}
echo;echo -e ${yellow}'Enabling Color for Pacman'${reset}
sudo sed -i "/#Color/c\Color" /etc/pacman.conf

# Install git and build tools
echo
echo -e ${yellow}'Installing git and build tools for AUR'${reset}
sudo pacman -S git autoconf make gcc perl fakeroot automake --noconfirm

# Make folder named jeremy-venditto in the home folder
echo;echo;echo -e ${yellow}'Creating folder ~/jeremy-venditto'${reset}
mkdir -p ~/jeremy-venditto && cd ~/jeremy-venditto

# Clone repos
echo;echo -e ${cyan}'Cloning Git Repositories into ~/jeremy-venditto'${reset}
echo;echo -e ${yellow}'Retrieving bash scripts'${reset}
git clone https://github.com/jeremy-venditto/bash-scripts
echo;echo -e ${yellow}'Retrieving configuration files'${reset}
git clone https://github.com/jeremy-venditto/dotfiles
echo;echo -e ${yellow}'Downloading wallpaper'${reset}
 # 800 wallpapers...
#git clone https://github.com/jeremy-venditto/wallpaper

# to not download 800 wallpapers...
mkdir -p ~/jeremy-venditto/wallpaper/1920x1080
curl -O https://raw.githubusercontent.com/jeremy-venditto/wallpaper/main/1920x1080/001.jpg
curl -O https://raw.githubusercontent.com/jeremy-venditto/wallpaper/main/1920x1080/002.jpg
curl -O https://raw.githubusercontent.com/jeremy-venditto/wallpaper/main/1920x1080/003.jpg
curl -O https://raw.githubusercontent.com/jeremy-venditto/wallpaper/main/1920x1080/004.jpg
curl -O https://raw.githubusercontent.com/jeremy-venditto/wallpaper/main/1920x1080/005.jpg
curl -O https://raw.githubusercontent.com/jeremy-venditto/wallpaper/main/1920x1080/006.jpg
curl -O https://raw.githubusercontent.com/jeremy-venditto/wallpaper/main/1920x1080/007.jpg
mv 001.jpg ~/jeremy-venditto/wallpaper/1920x1080
mv 002.jpg ~/jeremy-venditto/wallpaper/1920x1080
mv 003.jpg ~/jeremy-venditto/wallpaper/1920x1080
mv 004.jpg ~/jeremy-venditto/wallpaper/1920x1080
mv 005.jpg ~/jeremy-venditto/wallpaper/1920x1080
mv 006.jpg ~/jeremy-venditto/wallpaper/1920x1080
mv 007.jpg ~/jeremy-venditto/wallpaper/1920x1080


              ##################
              #### PACKAGES ####
              ##################

## Enable Multilib repository
echo;echo -e ${yellow}'Enabling Multilib Repository'${reset}
sudo sed -i '94s!#Include = /etc/pacman.d/mirrorlist!Include = /etc/pacman.d/mirrorlist!' /etc/pacman.conf
sudo pacman -Syyu

## Get Fastest Mirrors
#echo;echo -e ${cyan}'Setting mirrors to the fastest ones (this will take a while)'${reset}
#sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist

## Install Packages

        #Update Archlinux Keyring to prevent errors on older ISOs
echo;echo -e ${red}'Updating Archlinux Keyring on System'${reset}
sudo pacman -S archlinux-keyring --noconfirm

	#Packages for all machine types
#sudo pacman -S - < ~/jeremy-venditto/dotfiles/.resources/NEW_pacman_full --noconfirm
echo -e ${yellow}'Installing packages for all machine types'${reset}
sudo pacman -S lightdm lightdm-gtk-greeter-settings xorg-server xorg-xrdb xorg-xkill xorg-xprop xorg-xrandr awesome xterm terminator exa ufw firefox qt5ct nitrogen alsa-utils pulseaudio kvantum --noconfirm

        #Install yay AUR helper
echo
echo -e ${yellow}'Installing yay AUR helper'${reset}
git clone https://aur.archlinux.org/yay
cd yay && makepkg -si --noconfirm

        #Install machine specific packages

# Use this if you are following the arch wiki and backed your packges up.. My script pkg-backup.sh removes AUR packages
#pacman -S --needed $(comm -12 <(pacman -Slq | sort) <(your-package-list.txt))

if [[ $MACHINE = "DESKTOP" ]]; then
echo -e ${yellow}'Installing Desktop Packages'${reset}
sudo pacman -S - < ~/jeremy-venditto/dotfiles/.resources/desktop/Arch_PACMAN.txt --noconfirm
yay -S - < ~/jeremy-venditto/dotfiles/.resources/packages/desktop/Arch_AUR.txt --noconfirm;fi

if [[ $MACHINE = "LAPTOP" ]]; then
echo -e ${yellow}'Installing Laptop Packages'${reset}
sudo pacman -S - < ~/jeremy-venditto/dotfiles/.resources/packages/laptop/Arch_PACMAN.txt --noconfirm
yay -S - < ~/jeremy-venditto/dotfiles/.resources/packages/laptop/Arch_AUR.txt --noconfirm;fi

if [[ $MACHINE = "VIRTUAL" ]]; then
echo -e ${yellow}'Installing Virtual Machine Packages'${reset}
#sudo pacman -S - < ~/jeremy-venditto/dotfiles/.resources/packages/pacman_vm.txt --noconfirm
#yay -S - < ~/jeremy-venditto/dotfiles/.resources/packages/aur_vm.txt --noconfirm;fi
fi
#if [[ $MACHINE = "BASE-INSTALL" ]]; then
#echo -e ${yellow}'Installing Bare Minumum Packages'${reset}
#sudo pacman -S
#fi

              ###################
              ### EDIT CONFIG ###
              ###################

# Move config files/directories
    #files
echo -e ${cyan}'Copying configuration files'${reset}
echo
echo -e ${yellow}'Updated ~/.bash_profile'${reset}
cp ~/jeremy-venditto/dotfiles/.bash_profile ~/
echo -e ${yellow}'Updated ~/.bashrc'${reset}
cp ~/jeremy-venditto/dotfiles/.bashrc ~/
echo -e ${yellow}'Updated ~/.gtkrc-2.0'${reset}
cp ~/jeremy-venditto/dotfiles/.config/gtk-2.0/.gtkrc-2.0_dark ~/.gtkrc-2.0
echo -e ${yellow}'Updated ~/.profile'${reset}
cp ~/jeremy-venditto/dotfiles/.profile ~/
echo -e ${yellow}'Updated ~/.xinitrc'${reset}
cp ~/jeremy-venditto/dotfiles/.xinitrc ~/
echo -e ${yellow}'Updated ~/.xprofile'${reset}
cp ~/jeremy-venditto/dotfiles/.xprofile ~/
echo -e ${yellow}'Added files to /usr/share/pixmaps/'${reset}
sudo cp ~/jeremy-venditto/dotfiles/.resources/usrshare/pixmaps/* /usr/share/pixmaps/
    #directories
echo -e ${yellow}'Updated ~/.config/'${reset}
mkdir -p ~/.config
cp -r ~/jeremy-venditto/dotfiles/.config/* ~/.config
echo -e ${yellow}'Updated ~/.local/'${reset}
cp -r ~/jeremy-venditto/dotfiles/.local/ ~/

    #wallpaper directory? default is ~/
echo -e ${yellow}'Wallpaper Directory added to ~/wallpaper/'${reset}
mv ~/jeremy-venditto/wallpaper/ ~/ > /dev/null 2<&1

# Change Nitrogen Settings
echo -e ${magenta}'Nitrogen Settings Have Been Updated.'${reset}
echo -e ${yellow}'Wallpaper Directory Set to ~/wallpaper/1920x1080.'${reset}

if [[ $MACHINE = DESKTOP ]]; then sed -i "/DIRS=/c\DIRS=/home/"$USER"/files/wallpaper/1920x1080" ~/.config/nitrogen/nitrogen.cfg;fi
if [[ $MACHINE = LAPTOP ]]; then sed -i "/DIRS=/c\DIRS=/home/"$USER"/files/wallpaper/1920x1080" ~/.config/nitrogen/nitrogen.cfg;fi
if [[ $MACHINE = VIRTUAL ]]; then sed -i "/DIRS=/c\DIRS=/home/"$USER"/wallpaper/1920x1080" ~/.config/nitrogen/nitrogen.cfg;fi

# Create screen resolution scripts for virtual machines
if [[ $MACHINE = VIRTUAL ]]; then
echo -e ${yellow}'Added 2 screen resolution scripts to ~/'${reset}
echo "xrandr --output Virtual-1 --primary --mode 1024x768 --rate 60" > ~/screen-normal.sh
echo "xrandr --output Virtual-1 --primary --mode 1600x900 --rate 60" > ~/screen-almost-full.sh
echo "xrandr --output Virtual-1 --primary --mode 1920x1080 --rate 60" > ~/screen-full.sh
chmod +x ~/screen-normal.sh ~/screen-almost-full.sh ~/screen-full.sh;fi

              #########################
              #### Enable Services ####
              #########################

# Enable UFW firewall
echo -e ${cyan}'Enabling UFW Firewall'${reset}
sudo ufw enable && sudo systemctl enable --now ufw

# Enable TLP for laptop battery)
if [[ $MACHINE = LAPTOP ]]; then sudo systemctl enable --now tlp;fi

# Enable LightDM
echo -e ${cyan}'Enabling LightDM Display Manager'${reset}
sudo systemctl enable lightdm

              #####################################
              #### Update Application Settings ####
              #####################################

# Change LightDM settings
echo -e ${magenta}'LightDM Settings Have Been Updated.'${reset}
if [[ $MACHINE = DESKTOP ]]; then
sudo cp ~/jeremy-venditto/dotfiles/.resources/etc/lightdm/lightdm-gtk-greeter.conf_desktop /etc/lightdm/lightdm-gtk-greeter.conf;fi
if [[ $MACHINE = LAPTOP ]]; then
sudo cp ~/jeremy-venditto/dotfiles/.resources/etc/lightdm/lightdm-gtk-greeter.conf_laptop /etc/lightdm/lightdm-gtk-greeter.conf;fi
if [[ $MACHINE = VIRTUAL ]]; then
sudo cp ~/jeremy-venditto/dotfiles/.resources/etc/lightdm/lightdm-gtk-greeter.conf_vm /etc/lightdm/lightdm-gtk-greeter.conf;fi

# Change Grub Wallpaper
echo -e ${magenta}'Updating GRUB Settings...'${reset}
sudo cp ~/jeremy-venditto/dotfiles/.resources/usrshare/pixmaps/grub.png /usr/share/pixmaps/
sudo sed -i "/#GRUB_BACKGROUND=/c\GRUB_BACKGROUND=/usr/share/pixmaps/grub.png" /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
echo -e ${magenta}'GRUB Settings Have Been Updated.'${reset}

# Enable nano syntax highlighting
echo -e ${green}'Enabled Syntax Highlighting for the Nano Text Editor.'${reset}
~/jeremy-venditto/bash-scripts/nano-syntax-highlighting.sh

# Enabling Dark mode on QT5 and GTK applications
~/jeremy-venditto/bash-scripts/change-theme-gtk-qt.sh -d

# Enable Firefox Config (dark, with extensions and private browsing)
cp -r ~/github/dotfiles/.config/firefox/firefox-dark ~/.mozilla

# Copy Xterm configuration
echo -e ${green}'Xterm configuration copied to ~/.Xresources'${reset}
cp ~/.config/xterm/Xresources-dark ~/.Xresources
xrdb ~/.Xresources

# Install Dmenu
echo -e ${yellow}'Installing Dmenu'${reset} && cd ~/.config/dmenu &&
sudo make install && echo -e ${yellow}'Dmenu Has Been Installed.'${reset} || echo -e ${red}'Dmenu Installation Failed.'${reset}

# Install pasystray version 0.7.1-2 (later versions are black only)
 # This may be outdated now.. check it later
sudo cp ~/jeremy-venditto/dotfiles/.resources/packages/pasystray/* /var/cache/pacman/pkg
sudo pacman -U /var/cache/pacman/pkg/pasystray-0.7.1-2-x86_64.pkg.tar.zst --noconfirm
 # add pasystray to list of ignored upgrade
#echo 'IgnorePkg   = pasystray' | sudo tee -a /etc/pacman.conf
sudo sed -i '/#IgnorePkg/c\IgnorePkg   = pasystray' /etc/pacman.conf

              ############################
              #### Add user to groups ####
              ############################

  # All Systems
sudo usermod -aG video $USER
echo;echo -e ${green}"User added to group 'video'"${reset};echo

  # System Specific
checkvirtmanager=$(which virt-manager > /dev/null 2>&1)
if [[ $checkvirtmanager = /usr/bin/virt-manager ]]; then
sudo usermod -aG libvirt $USER && sudo systemctl enable --now libvirtd
echo -e ${green}"User added to group 'libvirt'"${reset};fi

checkvirtualbox=$(which virtualbox > /dev/null 2>&1)
if [[ $checkvirtualbox = /usr/bin/virtualbox ]]; then
sudo usermod -aG vboxusers $USER && echo -e ${green}"User added to group 'vboxusers'"${reset};fi

checkdocker=$(which docker > /dev/null 2>&1)
if [[ $checkdocker = /usr/bin/docker ]]; then 
sudo usermod -aG docker $USER && echo -e ${green}"User added to group 'docker'"${reset};fi

              ########################################################################
              #### Add setcap capabilities so we do not have to run these as root ####
              ########################################################################

   #Nethogs
checknethogs=$(which nethogs > /dev/null 2>&1)
if [[ $checknethogs = /usr/bin/nethogs ]]; then setcap cap_net_admin,cap_net_raw+ep /usr/bin/nethogs;fi

   #Wireshark
checkwireshark=$(which wireshark > /dev/null 2>&1)
if [[ $checkwireshark = /usr/bin/wireshark ]]; then setcap 'CAP_NET_RAW+eip CAP_NET_ADMIN+eip' /usr/bin/dumpcap;fi

              ######################################################################
              #### Configure Cursors, Fonts, Icons and Themes (GTK-2/3 and QT5) ####
              ######################################################################


mkdir -p ~/.local/share/fonts
mkdir -p ~/.local/share/icons
mkdir -p ~/.local/share/themes

# Fonts
sudo tar -xf ~/jeremy-venditto/dotfiles/.resources/fonts/adobe-all.tar.xz -C ~/.local/share/fonts
echo -e ${yellow}'Adobe Fonts Installed'${reset}
sudo tar -xf ~/jeremy-venditto/dotfiles/.resources/fonts/google-all.tar.xz -C ~/.local/share/fonts
echo -e ${yellow}'Google Fonts Installed'${reset}
sudo tar -xf ~/jeremy-venditto/dotfiles/.resources/fonts/microsoft-all.tar.xz -C ~/.local/share/fonts
echo -e ${yellow}'Microsoft Fonts Installed'${reset}
sudo tar -xf ~/jeremy-venditto/dotfiles/.resources/fonts/nerd-all.tar.xz -C ~/.local/share/fonts
echo -e ${yellow}'Nerd Fonts Installed'${reset}
sudo tar -xf ~/jeremy-venditto/dotfiles/.resources/fonts/noto-all.tar.xz -C ~/.local/share/fonts
echo -e ${yellow}'Noto Fonts Installed'${reset}

# Cursors
sudo tar -xf ~/jeremy-venditto/dotfiles/.resources/cursors/cursors-all.tar.xz ~/.local/share/icons
echo -e ${yellow}'Cursors Installed'${reset}

# Icons
sudo tar -xf ~/jeremy-venditto/dotfiles/.resources/cursors/icons-all.tar.xz -C ~/.local/share/icons
echo -e ${yellow}'Icons Installed'${reset}
# Themes
sudo tar -xf ~/jeremy-venditto/dotfiles/.resources/cursors/themes-all.tar.xz -C ~/.local/share/themes
echo -e ${yellow}'Themes Installed'${reset}


# Adwaita
#sudo tar -xf ~/jeremy-venditto/dotfiles/.resources/themes/144237-Adwaita.tar.gz -C /usr/share/themes
#echo -e ${yellow}'Adwaita Theme added'${reset}
# Adwaita-Dark
#sudo tar -xf ~/jeremy-venditto/dotfiles/.resources/themes/148170-Adwaita-Dark.tar.gz -C /usr/share/themes
#echo -e ${yellow}'Adwaita-Dark Theme added'${reset}
# Kanada Icons
#sudo tar -xf ~/jeremy-venditto/dotfiles/.resources/icons/KanadaIcons.tar.xz -C /usr/share/icons
#echo -e ${yellow}'Kanada Icons added'${reset}
# Kanada Cursors
#sudo tar -xf ~/jeremy-venditto/dotfiles/.resources/cursors/KanadaCursors.tar.xz -C /usr/share/icons
#echo -e ${yellow}'Kanada Cursors added'${reset}
# Obsidian Red Icons
#sudo tar -xf ~/jeremy-venditto/dotfiles/.resources/icons/Obsidian-Red.tar.xz -C /usr/share/icons
#echo -e ${yellow}'Obsidian Red Icons added'${reset}
# Candy Icons
#sudo tar -xf ~/jeremy-venditto/dotfiles/.resources/icons/candy-icons.tar.xz -C /usr/share/icons
#echo -e ${yellow}'Candy Icons added'${reset}
# Infinity Dark Icons
#sudo tar -xf ~/jeremy-venditto/dotfiles/.resources/icons/Infinity-Dark-Icons.tar.xz -C /usr/share/icons
#echo -e ${yellow}'Infinity Dark Icons added'${reset}
# Infinity Light Icons
#sudo tar -xf ~/jeremy-venditto/dotfiles/.resources/icons/Infinity-Light-Icons.tar.xz -C /usr/share/icons
#echo -e ${yellow}'Infinity Light Icons added'${reset}
# Red Dot Black Dark Icons
#sudo tar -xf ~/jeremy-venditto/dotfiles/.resources/icons/Red-Dot-Black-Dark-Icons.tar.xz -C /usr/share/icons
#echo -e ${yellow}'Red Dot Black Icons added'${reset}
# Shiny Dark Icons
#sudo tar -xf ~/jeremy-venditto/dotfiles/.resources/icons/Shiny-Dark-Icons.tar.xz -C /usr/share/icons
#echo -e ${yellow}'Shiny Dark Icons added'${reset}
# Sweet Dark Icons
#sudo tar -xf ~/jeremy-venditto/dotfiles/.resources/icons/Sweet-Dark-v40.tar.xz -C /usr/share/icons
#echo -e ${yellow}'Sweet Dark Icons added'${reset}
# Sweet Mars Icons
#sudo tar -xf ~/jeremy-venditto/dotfiles/.resources/icons/Sweet-mars.tar.xz -C /usr/share/icons
#echo -e ${yellow}'Sweet Mars icons added'${reset}
# Enlightenment-X Icons
#sudo tar -xf ~/jeremy-venditto/dotfiles/.resources/icons/Enlightenment-X.tar.xz -C /usr/share/icons
#echo -e ${yellow}'Enlightenment-X icons added'${reset}
# ePapirus Icons
#sudo tar -xf ~/jeremy-venditto/dotfiles/.resources/icons/ePapirus.tar.xz -C /usr/share/icons
#echo -e ${yellow}'ePapirus Icons added'${reset}

              ###################
              ## End of Script ##
              ###################

echo;echo -e ${green}'Script Complete!'${reset}

} # End function USERSPACE_SHELL


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



# AUTOMATED PROMPT ( does do anything RIGHT NOW, so KEEP IT)
# AUTOMATED_ALL

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
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

#### TO DO #####
# Make wallpaper directory switcher script
# sed arch-user to $USER on all config files before copying config
