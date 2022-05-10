#!/bin/bash

# My Arch Linux Install

#----------------------------------------------------
function part_1 {
# Initial ISO install.. manual intervention is required for this step as of now
ln /sys/firmware/efi/efivars
sleep 1
ping -c 3 archlinux.org
iplink
#wifi?
#wifi-menu
timedatectl set-ntp true
lsblk
sleep 1
# which device? 
INSTALLDRIVE=/dev/vda
cfdisk $INSTALLDRIVE
# EFI Partition?
USEREFI= input
mkfs.fat -F32 $USEREFI
# Root?
USERROOT = input
mkfs.ext4 $USERROOT
# Home?
USERHOME = input
mkfs.ext4 $USERHOME
mount $USERROOT /mnt
mkdir /mnt/home
mount $USERHOME /mnt/home
lsblk
echo look good? Y/N
pacstrap -i /mnt base linux linux-firmware sudo nano
genfstab -U -p /mnt >> /mnt/etc/fstab
arch-chroot /mnt /bin/bash
mkdir /delete && sudo pacman -S git
cd /delete && git clone https://github.com/jeremy-venditto/bash-scripts
cd bash-scripts && ./arch-install.sh
}

#----------------------------------------------------
function part_2 {
# Script is running at this point to finish initial install
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime
hwclock --systohc --utc
date
sleep 2
USERHOSTNAME=archvm
echo $USERHOSTNAME > /etc/hostname
echo "127.0.1.1 localhost.localdomain $USERHOSTNAME" >> /etc/hosts
pacman -S networkmanager grub efiboomgr
systemctl enable NetworkManager
echo 'set root password...'
passwd
## EFI
mkdir /boot/efi
mount /dev/sda1 /boot/efi
lsblk # to check if everything is mounted correctly
sleep 5
grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/efi --removable
grub-mkconfig -o /boot/grub/grub.cfg
exit
umount -R /mnt
reboot
}

#----------------------------------------------------
function part_3 {
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

EDITOR=nano visudo
# %wheel ALL=(ALL) ALL
# use sed to uncomment
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
sudo pacman -S - < ~/jeremy-venditto/dotfiles/.resources/NEW_pacman_full
sudo pacman -S - < ~/jeremy-venditto/dotfiles/.resources/NEW_aur_full
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
#echo "Sudo required for moving files to /usr/share/pixmaps/"
sudo mv ~/jeremy-venditto/dotfiles/usr/share/pixmaps/* /usr/share/pixmaps/
  #directories
mv ~/jeremy-venditto/dotfiles/.config/ ~/
mv ~/jeremy-venditto/dotfiles/.local/ ~/
    #wallpaper
    #wallpaper directory? default is ~/
mv ~/jeremy-venditto/wallpaper/ ~/



## Screen Resolution for virtual machines
echo "xrandr --output Virtual-1 --primary --mode 1024x768 --rate 60" > ~/jeremy-venditto/screen-normal.sh
echo "xrandr --output Virtual-1 --primary --mode 1920x1080 --rate 60" > ~/jeremy-venditto/screen-full.sh
chmod +x ~/jeremy-venditto/screen*

		# Services

# Enable UFW firewall
sudo ufw enable
sudo systemctl enable --now ufw

# Enable LightDM
sudo systemctl enable lightdm

# Change LightDM settings
if [[ $MACHINE = DESKTOP ]]; then echo 'soon';fi
if [[ $MACHINE = LAPTOP ]]; then echo 'soon';fi
if [[ $MACHINE = VIRTUAL ]]; then sudo cp ~/jeremy-venditto/dotfiles/etc/lightdm/lightdm-gtk-greeter.conf_laptop /etc/lightdm/lightdm-gtk-greeter.conf;fi

# Change Nitrogen Settings
if [[ $MACHINE = DESKTOP ]]; then echo 'soon';fi
if [[ $MACHINE = LAPTOP ]]; then echo 'soon';fi
if [[ $MACHINE = VIRTUAL ]]; then sed -i "/DIRS=/c\DIRS=/home/"$USER"/wallpaper/1920x1080" ~/.config/nitrogen/nitrogen.cfg;fi

# Change Grub Wallpaper
sudo sed -i "/#GRUB_BACKGROUND=/c\GRUB_BACKGROUND=/home/"$USER"/wallpaper/grub/004-1024x768" /etc/default/grub

# Enable nano syntax highlighting
~/jeremy-venditto/bash-scripts/nano-syntax-highlighting.sh

### install dmenu
cd ~/.config/dmenu && sudo make install

echo 'script complete'
}


### MAIN PROMPT ####
PS3='Please enter your choice: '
options=("Part 1" "Part 2" "Part 3" "Quit")
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















