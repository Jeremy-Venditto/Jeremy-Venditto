#!/bin/bash


# List Sources
#source current-dir.sh
SCRDIR=$PWD
PKGLISTYUM=$SCRDIR/pkg-list_yum
PKGLISTAPT=$SCRDIR/pkg-list_apt
PKGLISTPACMAN=$SCRDIR/pkg-list_pacman
PKGLISTAUR=$SCRDIR/pkg-list_aur

# Prompt #1

read -r -p "Do you want to install pacakges from the package list I have generated? [Y/n] " input

case $input in
    [yY][eE][sS]|[yY])
 echo "Installing packages..."
 ;;
    [nN][oO]|[nN])
$SCRDIR/pkg_install-base.sh
       ;;
    *)
 echo "Invalid input..."
 exit 1
 ;;
esac

# Find Package Manager Install Appropriate Package List

  YUM_CMD=$(which yum) > /dev/null 2>&1
  APT_GET_CMD=$(which apt-get) > /dev/null 2>&1
  PACMAN_CMD=$(which pacman) > /dev/null 2>&1
  
 if [[ ! -z $YUM_CMD ]]; then
    yum install --needed - < $PKGLISTYUM
elif [[ ! -z $APT_GET_CMD ]]; then
    apt-get install --needed - < $PKGLISTAPT
 elif [[ ! -z $PACMAN_CMD ]]; then
    sudo pacman -S --needed - < $PKGLISTPACMAN
  else
    echo "error can't install package"
    exit 1;
 fi


# Prompt #2

read -r -p "Do you want to install the AUR (Arch only)?"

case $input in
    [yY][eE][sS]|[yY])
 
	# Download Yay install it

cd $SCRDIR
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -Si
yay -S --needed - <$PKGLISTAUR

 ;;
    [nN][oO]|[nN])
 echo "No"
       ;;
    *)
 echo "Invalid input..."
 exit 1
 ;;
esac
