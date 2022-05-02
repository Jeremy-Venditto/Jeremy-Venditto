read -r -p "install cronjob for nitrogen? [Y/n] " input

case $input in
    [yY][eE][sS]|[yY])

        echo installing cronie service
sudo systemctl enable cronie
sudo systemctl start cronie

        echo installing crontab
crontab -l | { cat; echo "*/3 * * * * (export DISPLAY=:0.0 && /bin/date && /usr/bin/nitrogen --set-zoom-fill --random $HOME/wallpaper/1920x1080 --save) > /t /tmp/myNitrogen.log 2>&1"; | crontab -

	echo cronjob installed with wallpaper switching every 3 minutes (1 monitor)

 ;;
    [nN][oO]|[nN])

 echo "aborted cronjob post-install script"
       ;;
    *)
 echo "Invalid input..."
 exit 1
 ;;
esac
