# Log in as current user

# Add current user to groups: lp rfkill vboxusers video and wheel

echo -e "adding current user to groups: lp rfkill vboxusers video wheel"
sudo usermod -aG video wheel vboxusers rfkill lp $USER

# Configure Firewall

        echo enabling ufw firewall

sudo ufw enable
sudo systemctl enable ufw
sudo systemctl start ufw

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$SRCDIR=$PWD
function pkglist_pacman {
sudo pacman -S --needed - < $SRCDIR/pkg-list_pacman
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function pkglist_base{
sudo pacman -S --needed - < #SRCDIR/pkg-list_base
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function packages_choice {
read -r -p "Do you want to install pacakges from the package list I have generated? [Y/n] " input

case $input in
    [yY][eE][sS]|[yY])
 echo "Installing packages from pkg-list_pacman"
pkglist_pacman
 ;;
    [nN][oO]|[nN])
pkglist_base
       ;;
    *)
 echo "Invalid input..."
 exit 1
 ;;
esac
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# Make Git Directory

        echo making directory ~/git if it does not exist
mkdir -p $HOME/git
cd $HOME/git

        echo downloading my scripts
git clone https://github.com/computerjerms/dotfiles.git
git clone https://github.com/computerjerms/wallpaper.git
git clone https://github.com/computerjerms/dmenu.git

        echo downloading and installing yay
git clone https://aur.archlinux.org/yay
makepkg -si

        echo copying config files to ~/.config/
cd ~/git/dotfiles/config
cp -r awesome dmenu fonts mpd nitrogen obs-studio openbox picom pulse >
cd ~/.config/dmenu && sudo make install

echo copying and installing home config files to ~/
cd ~/git/home && cp .*/ ~/

        echo copying awesome fonts into ~/.local/share/fonts
cd ~/.config/awesome/widgets
cp awesomewm-font.ttf ~/.local/share/fonts


        echo replacing current .bashrc
cd $HOME
rm .bashrc
cd git/dotfiles
cp .bashrc ~/
cd ~/
source ~/.bashrc

        echo copying wallpaper directory into $HOME/wallpaper
cd $HOME/git
cp -r wallpaper ~/

        echo setting the default wallpaper folder for nitrogen
nitrogen --random $HOME/wallaper/1920x1080

        echo installing cronie service
sudo systemctl enable --now cronie
crontab -l | { cat; echo "*/3 * * * * (export DISPLAY=:0.0 && /bin/date && /usr/bin/nitrogen --set-zoom-fill --random $HOME/wallpaper/1920x1080 --save) > /tmp/myNitrogen.log 2>&1"; | crontab -e

        echo installing cups printer service
sudo systemctl enable --now cups

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function tlp_install {
read -r -p "Enable TLP on your laptop? [Y/n] " input

case $input in
    [yY][eE][sS]|[yY])

sudo systemctl --now enable tlp
        echo "TLP has been succesfuly been enabled."
 ;;
    [nN][oO]|[nN])

 #move to next script
 echo "abort tlp post-install script"
       ;;
    *)
 echo "Invalid input..."
 exit 1
 ;;
esac
}

tlp_install
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

        echo downloading aur packages..

        echo install PIP
pip install pip #Updates Pip
        echo install spotdl
pip install spotdl

	echo configuring kernel parameter for virtualbox
modprobe vboxdrv

	echo it is time to reboot

