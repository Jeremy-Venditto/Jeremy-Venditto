read -r -p "install CUPS printer service and drivers? [Y/n] " input

case $input in
    [yY][eE][sS]|[yY])


        echo installing cups printer service
sudo systemctl enable cups
sudo systemctl start cups

	echo installing HP Photosmart B-209A Drivers

cd ~/git/postinstall/hp
./whateverthefileis

echo downloads are complete and HP drivers have been installed

 ;;
    [nN][oO]|[nN])

 echo "aborted printer post-install script"
       ;;
    *)
 echo "Invalid input..."
 exit 1
 ;;
esac
