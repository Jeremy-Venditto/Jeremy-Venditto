# TLP is a power saving utility 

read -r -p "Enable TLP on your laptop? [Y/n] " input

case $input in
    [yY][eE][sS]|[yY])

sudo systemctl --now enable tlp 
#sudo systemctl start tlp
sudo systemctl status tlp
sleep 1
	echo TLP has been succesfuly been enabled.
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
