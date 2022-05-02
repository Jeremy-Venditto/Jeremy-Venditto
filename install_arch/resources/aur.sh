read -r -p "download and install aur packages? [Y/n] " input

case $input in
    [yY][eE][sS]|[yY])

        echo downloading aur packages..

yay -S ascii-design brave-bin figlet-fonts deadbeef etchber-bin librewolf-bin lyrebird mictray spotify stacer

	echo successfully installed aur packages

 ;;
    [nN][oO]|[nN])

 echo "abort aur post-install script"
       ;;
    *)
 echo "Invalid input..."
 exit 1
 ;;
esac
