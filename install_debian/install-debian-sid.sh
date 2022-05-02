#!/bin/bash
SRC=$PWD

PROMPT1COLOR='tput setaf 7'
PROMPT2COLOR='tput setaf 5'

# ~~~~~~~~~~~ BEGIN SCRIPT ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#~~~~~~~.

	# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~SCRIPT-PROMPT~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#~~~~~~~|
        echo -e "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"										#
        echo -e " _       ()      "															#
        echo -e "((omputer||erms  "															#
        echo -e "        [_|      "															#
        echo -e "                 "															#
	echo -e "\e[1;34mInstalling Jerms' Debian 11 Post-install Script.\e[0m"										#	|
	echo -e "\e[1;34mThis script will take approximately 40 minutes to execute.\e[0m"								#
	echo -e "\e[1;34mThis script requires sudo or a root password to add sudo\e[0m"									#
	echo -e "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"										#
echo " "
	read -p $'\e[1;37mConinue? [Y/n]\e[0m ' input														#
	case $input in																	#
	# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~SCRIPT-PROMPT-YES~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	    [yY][eE][sS]|[yY])


        #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        # Virtual Machine
        #~~~~~~~~~~~~~~~~
#        echo "Are you using a Virtual Machine?"
#        function virtual_machine {
#        read -r -p "Are You Sure? [Y/n] " input
#
 #       case $input in
 #           [yY][eE][sS]|[yY])
#
#        function group_vboxsf {
#        GROUP=vboxsf
#        if id -nG "$USER" | grep -qw "$GROUP"; then
#            echo "User $USER belongs to $GROUP group, continuing.."
#        else
#            echo "$USER does not belong to $GROUP .. adding it now"
#	touch $SRC/runasroot-vbox.sh && chmod +x $SRC/runasroot-vbox.sh
#        cat >> $SRC/runasroot-vbox.sh<< EOF
#	sudo usermod -a -G vboxsf $USER
#	su -c $SRC/runasroot-vbox.sh
#	echo 'yes' >> $SRC/vbox_input.txt
 #        ;;
  #          [nN][oO]|[nN])
  #      echo "Continuing..."
#	touch $SRC/vbox_input.txt
#	echo 'no' >> $SRC/vbox_input.txt
#      ;;
#            *)

#         echo -e "\e[1;33mInvalid Input.\e[0m"
#         exit 1
#         ;;
#        esac
#        }
	#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        # Check to see if sudo is enabled for this user --curently checks all users
	#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	echo " "
        echo -e "\e[1;33mChecking to see if sudo is enabled for this user...\e[0m"
	touch $SRC/runasroot.sh && chmod +x $SRC/runasroot.sh
	function group_sudo {
GROUP=sudo
	if id -nG "$USER" | grep -qw "$GROUP"; then
        echo -e "\e[32mUser '$USER' belongs to the group '$GROUP', contiuing...\e[0m"
	    echo " "
	else
	    echo "$USER does not belong to $GROUP .. adding it now"

	cat >> $SRC/runasroot.sh<< EOF
#EOF
	#NAME=$USER
	sudo usermod -a -G sudo $USER || echo "please run this script again after reboot" || sleep 3 && systemctl reboot
EOF
dpkg -l | grep -qw sudo || echo "sudo is not configured, please enter your root password" && su -c $SRC/runasroot.sh
	fi
	}
	group_sudo

	#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	# Install Desired Repositories
	#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function sources_list {
sourcelist=/etc/apt/sources.list
if [[ -e $sourcelist.old || -L $sourcelist.old ]] ; then
    i=0
    while [[ -e $sourcelist-$i.old || -L $sourcelist-$i.old ]] ; do
        let i++
    done
    sourcelist=$sourcelist-$i
fi
sudo touch -- "$sourcelist".old
sudo cp /etc/apt/sources.list "$sourcelist.".old
}

function sources_list_d {
SOURCELIST_D=/etc/apt/sources.list.d
if [[ -e $SOURCELIST_D.old || -L $SOURCELIST_D.old ]] ; then
    i=0
    while [[ -e $SOURCELIST_D-$i.old || -L $SOURCELIST_D-$i.old ]] ; do
        let i++
    done
    SOURCELIST_D=$SOURCELIST_D-$i
fi
sudo mkdir -- "$SOURCELIST_D".old
}

#sources_list
#sources_list_d

# move original source files
sudo mv /etc/apt/sources.list $SRC/original_sources.list
sudo mv /etc/apt/sources.list.d $SRC/original_sources.list.d 2> /dev/null
sudo mkdir -p /etc/apt/sources.list.d
touch -- "$SRC/tempsources.list"
TEMPSOURCES=$SRC/tempsources.list

	function deb_version {
	echo "Which Debian release are you using?"

	PS3='Please enter your choice: '
	options=("Bullseye" "Buster" "Stretch" "Quit")
	select opt in "${options[@]}"
	do
	    case $opt in
	        "Bullseye")
	            RELEASEINPUT=bullseye
	break
	            ;;
	        "Buster")
	            RELEASEINPUT=buster
	break
	            ;;
	        "Stretch")
	            RELEASEINPUT=stretch
	break
	            ;;
	        "Quit")
	            break
	            ;;
	        *) echo "invalid option $REPLY";;
	    esac
	done
	}

	# ~~~~~~~~~~~~~~~~ Standard Repo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	# Bullseye Standard Repo
	function standard_repo {
	if [ "$CHOSEN" = "bullseye" ] ; then
	echo " i dont have these yet "
	# Buster Standard Repo
	elif [ "$CHOSEN" = "buster" ] ; then
        echo " i dont have these yet "
	# Stretch Standard Repo
	elif [ "$CHOSEN" = "stretch" ] ; then
        echo " i dont have these yet "
	fi
	}

	# ~~~~~~~~~~~~~~~~ Backports REPO ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	# Bullseye Backport Repos
	function backports_repo {
	if [ "$CHOSEN" = "bullseye" ] ; then

	echo 'deb http://deb.debian.org/debian bullseye-backports main contrib non-free' >> $TEMPSOURCES
	echo 'deb-src http://deb.debian.org/debian bullseye-backports main contrib non-free' >> $TEMPSOURCES
	echo 'deb http://security.debian.org/debian-security bullseye-security main contrib non-free' >> $TEMPSOURCES
	echo 'deb-src http://security.debian.org/debian-security bullseye-security main contrib non-free'>> $TEMPSOURCES

	# Buster Backport Repos
	elif [ "$CHOSEN" = "buster" ] ; then
        echo " i dont have these yet "
	# Stretch Backport Repos
	elif [ "$CHOSEN" = "stretch" ] ; then
        echo " i dont have these yet "

	fi
	}

	# ~~~~~~~~~~~~~~~~~~ SID REPO ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	function sid_repo {

	# Bullseye SID Repo
	if [ "$CHOSEN" = "bullseye" ] ; then
touch $SRC/sid.repo
echo 'deb http://ftp.de.debian.org/debian sid main contrib non-free' >> $SRC/sid.repo
echo 'deb http://deb.debian.org/debian sid main contrib non-free' >> $SRC/sid.repo
echo 'deb-src http://deb.debian.org/debian sid main contrib non-free' >> $SRC/sid.repo
echo 'deb http://security.debian.org/debian-security bullseye-security main contrib non-free' >> $SRC/sid.repo
echo 'deb-src http://security.debian.org/debian-security bullseye-security main contrib non-free' >> $SRC/sid.repo
sudo cp $SRC/sid.repo /etc/apt/sources.list
#tput setaf 2
#touch $SRC/intel.list
#echo 'deb http://deb.debian.org/debian/ bullseye main contrib non-free' >> $SRC/intel.list
#echo 'deb-src http://deb.debian.org/debian/ bullseye main contrib non-free' >> $SRC/intel.list
#echo 'deb http://security.debian.org/debian-security bullseye-security main contrib non-free' >> $SRC/intel.list
#echo 'deb-src http://security.debian.org/debian-security bullseye-security main contrib non-free' >> $SRC/intel.list
#sudo rm /etc/apt/sources.list
#sudo cp $SRC/intel.list /etc/apt/sources.list


#	sudo echo "deb http://deb.debian.org/debian/ sid main contrib non-free" | sudo tee /etc/apt/sources.list
 #       sudo echo 'deb http://ftp.de.debian.org/debian sid main contrib non-free'| sudo tee /etc/apt/sources.list
  #      sudo echo 'deb-src http://deb.debian.org/debian sid main contrib non-free'| sudo tee /etc/apt/sources.list
   #     sudo echo 'deb http://security.debian.org/debian-security bullseye-security main contrib non-free'| sudo tee /etc/apt/sources.list
    #    sudo echo 'deb-src http://security.debian.org/debian-security bullseye-security main contrib non-free'| sudo tee /etc/apt/sources.list


	# Buster SID Repo
	elif [ "$CHOSEN" = "buster" ] ; then
        echo " i dont have these yet "
	# Stretch SID Repo
	elif [ "$CHOSEN" = "stretch" ] ; then
        echo " i dont have these yet "

	fi
	}

	# ~~~~~~~~~~~~~~~ Choose Repository ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	function choose_repo {
	echo " "
	echo "Which repositories do you want to use?"
	echo -e "\e[31mDeadbeef Music Player required SID\e[0m"
	$PROMPT2COLOR
	PS3='Please enter your choice: '
	options=("Standard" "Backports" "SID" "Quit")
	select opt in "${options[@]}"
	do
	    case $opt in
	        "Standard")
	echo "standard"
	            standard_repo
		   break
	            ;;
	        "Backports")
	echo "backports"
	            backports_repo
	            break
	            ;;
	        "SID")
	echo "sid"
	            sid_repo
	            break
	            ;;
	        "Quit")
	            break
	            ;;
	        *) echo "invalid option $REPLY";;
	    esac
	done
echo " "
	}

	# ~~~~~~~~~~~~~~~~~ Balena Etcher Repo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#	function etcher_repo {
#	curl -1sLf \
#	   'https://dl.cloudsmith.io/public/balena/etcher/setup.deb.sh' \
#	   | sudo -E bash
#	sudo apt update
#	}

	# ~~~~~~~~~~~~~~~~~ Virtualbox Repo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#	function virtualbox_repo {
#	wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
#	wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
#	sudo echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian bullseye contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
#	}

	# ~~~~~~~ REPOSITORY SCRIPT~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	RELEASE=$RELEASEINPUT							#	|
#	HERE=$PWD/newsources.list						#	|
	#touch $PWD/tempsources.list								#	|
#	sudo cp $PWD/tempsources.list /etc/apt/sources.list
# color for release prompt (prompt 1)
$PROMPT1COLOR
#tput setaf 7
	deb_version								#	|
# color for repo prompt (prompt 2)
#tput setaf 5
$PROMPT2COLOR
	choose_repo								#	|
	sudo cp $SRC/tempsources.list /etc/apt/sources.list					#	|
##	sudo rm $SRC/tempsources.list
	sudo cp $TEMPSOURCES /etc/apt/sources.list
#tput setaf 2
	sudo apt update && sudo apt dist-upgrade				#	|
#tput setaf 5
	# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~.
	# install Packages									#
	#~~~~~~~~~~~~~~~~~									#
		#										#
	        # ----------------------------------------------------------------------#	#
        	# Installing essential packages						#	#
	        # -----------------------------						#	#
											#	#
	                # ~~~~~~~~~~							#	#
        	        # Intel Wifi							#	#
	                # ~~~~~~~~~~							#	#
function nonfree_intel {
#sourcelist_intel=/etc/apt/sources.list
#if [[ -e $sourcelist_intel.old || -L $sourcelist_intel.old ]] ; then
#    i=0
#    while [[ -e $sourcelist_intel-$i.old || -L $sourcelist_intel-$i.old ]] ; do
#        let i++
#    done
#    sourcelist_intel=$sourcelist_intel-$i
#fi
#sudo touch -- "$sourcelist_intel".old
#sudo cp /etc/apt/sources.list "$sourcelist_intel.".old

tput setaf 2
touch $SRC/intel.list
echo 'deb http://deb.debian.org/debian/ bullseye main contrib non-free' >> $SRC/intel.list
echo 'deb-src http://deb.debian.org/debian/ bullseye main contrib non-free' >> $SRC/intel.list
echo 'deb http://security.debian.org/debian-security bullseye-security main contrib non-free' >> $SRC/intel.list
echo 'deb-src http://security.debian.org/debian-security bullseye-security main contrib non-free' >> $SRC/intel.list
sudo rm /etc/apt/sources.list
sudo cp $SRC/intel.list /etc/apt/sources.list
tput setaf 2
sudo apt update
}

                        function intel_cpu {                                            #       #
echo " "
read -p $'\e[1;37mDo you have an Intel CPU? [Y/n]\e[0m' input
#read -r -p "[Y/n] " input                                      #       #
                        case $input in                                                  #       #
                            [yY][eE][sS]|[yY])                                          #       #
echo " "
echo -e "\e[1;36mAdding contrib and non-free repositories\e[0m"
echo " "
nonfree_intel

echo " "
	                echo -e "\e[1;34mInstalling wifi driver\e[0m"					#	#
echo " "
tput setaf 2
	                 sudo apt install firmware-iwlwifi				#	#

#        choose_repo                                                             #       |
#        sudo cp $SRC/tempsources.list /etc/apt/sources.list                                     #       |
#       sudo rm $SRC/tempsources.list
#        sudo cp $TEMPSOURCES /etc/apt/sources.list
#tput setaf 2
        sudo apt update && sudo apt dist-upgrade                                #       |
#tput setaf 5

	                 ;;								#	#
	                    [nN][oO]|[nN])						#	#
echo -e "\e[1;33mNo problem, continuing...\e[0m"
#        choose_repo                                                             #       |
#        sudo cp $SRC/tempsources.list /etc/apt/sources.list                                     #       |
#       sudo rm $SRC/tempsources.list
#        sudo cp $TEMPSOURCES /etc/apt/sources.list
#tput setaf 2
#        sudo apt update && sudo apt dist-upgrade                                #       |
#tput setaf 5


	                       ;;							#	#
	                    *)								#	#
	                 echo -e "\e[1;33mInvalid Input.\e[0m"					#	#
	                 								#	#
	                 ;;								#	#
	                esac								#	#
	                }								#	#
#			tput setaf 2
	                intel_cpu							#	#

			# ~~~~~~~~~~~~~~~~~~~~~~~~~~
			# Virtualbox guest additions
			# ~~~~~~~~~~~~~~~~~~~~~~~~~~

        function virtualbox_repo {
tput setaf 2
        wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
        wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
        sudo echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian bullseye contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
        }


	function vbox_cd {
	echo -e "\e[1;34mPlease insert your Guest Additions CD now.\e[0m"
echo " "
read -p $'\e[1;37mPlease insert your Guest Additions CD now.. Continue? [Y/n]\e[0m' input
#read -r -p "Continue? [Y/n] " input

	        case $input in
	            [yY][eE][sS]|[yY])
	#cd /media/cdrom0 && sudo ./VBoxAdditions.run
	#sudo chown -R $USER:users /media/sf_Public/
	echo "hi you can delete this, it works"
	         ;;
	            [nN][oO]|[nN])

	         echo -e "\e[1;33mVirtualbox Guest Additions NOT installed...\e[0m"
	               ;;
	            *)

	         echo -e "\e[1;33mInvalid Input.\e[0m"
	         exit 1
	         ;;
	        esac
	}                                                                                       #       #


	function guest_additions {
echo " "
read -p $'\e[1;37mAre you using a Virtual Machine? [Y/n]\e[0m' input
echo " "
        case $input in
            [yY][eE][sS]|[yY])

#echo "Please insert your Guest Additions CD now.."

tput setaf 2
sudo apt update && sudo apt install build-essential dkms linux-headers-$(uname -r)
        GROUP=vboxsf
        if id -nG "$USER" | grep -qw "$GROUP"; then
echo " "
            echo "User '$USER' belongs to $GROUP group, continuing.."
        else
            echo "$USER does not belong to $GROUP .. adding it now"
####        touch $SRC/runasroot-vbox.sh && chmod +x $SRC/runasroot-vbox.sh
####        cat >> $SRC/runasroot-vbox.sh<< EOF
        sudo usermod -a -G vboxsf $USER
####        su -c $SRC/runasroot-vbox.sh
tput setaf 2 #maybe
	virtualbox_repo
	vbox_cd
	fi
         ;;
            [nN][oO]|[nN])

	echo -e "\e[1;33mVirtualbox was not configured.\e[0m"

               ;;
            *)

         echo -e "\e[1;33mInvalid Input.\e[0m"
         exit 1
         ;;
        esac
        }
			guest_additions

                	#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~					#	#
	                # install Gnupg, Curl, and Git					#	#
	                #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~					#	#
			echo " "
	                echo -e "\e[1;34minstalling gnupg2, curl and git\e[0m"				#	#
echo " "
			tput setaf 2
        	        sleep 2 && sudo apt install gnupg2 curl git			#	#
											#	#
		# ----------------------------------------------------------------------.	#
		#										#
		# ~~~~~~~~~~~~~									#
		# Standard Repo									#
		# ~~~~~~~~~~~~~									#

echo " "
read -p $'\e[1;37mInstall Useful Repo Packages? [Y/n]\e[0m' input
echo " "
        case $input in
            [yY][eE][sS]|[yY])
                tput setaf 2
		sudo apt install ufw awesome xterm light terminator exa neofetch mpd chromium system-config-printer nitrogen hplip cups gcc make perl fakeroot blueman pasystray tlp picom git redshift redshift-gtk timeshift rsync mpc qlipper ncmpcpp playerctl timidity mpdris2 python3-mutagen lxappearance qt5ct qt5-style-kvantum meson valac cmake build-essential libgtk-3-dev libgee-0.8-dev gir1.2-gee-0.8 libpulse-dev libnotify-dev nextcloud-desktop gimp blender audacity handbrake lmms kdenlive exe-thumbnailer ffmpegthumbnailer-dbg ffmpegthumbnailer heif-thumbnailer icoextract-thumbnailer apt-listbugs cmatrix yasm autopoint automake libtool intltool
         ;;
            [nN][oO]|[nN])

        echo -e "\e[1;33mPackages were not installed.\e[0m"
               ;;
            *)

         echo -e "\e[1;33mInvalid Input.\e[0m"
         exit 1
         ;;
        esac
												#
		# ~~~~~~~~~~~									#
	        # Set up Snap									#
		# ~~~~~~~~~~~									#


echo " "
read -p $'\e[1;37mInstall Snap? [Y/n]\e[0m' input
echo " "
	case $input in
	    [yY][eE][sS]|[yY])
		tput setaf 2
                sudo apt-get install  snapd                                                     #
                sudo systemctl enable --now snapd                                               #
                sudo snap install firefox chromium br=ave spotify termdown thunderbird           #
	 ;;
	    [nN][oO]|[nN])
        echo -e "\e[1;33mSnap was not installed.\e[0m"
#	echo "Snap was not installed"
        echo -e "\e[1;33mfirefox chromium brave spotify termdown thunderbird were not installed.\e[0m"
#	echo "firefox chromium brave spotify termdown thunderbird were not installed"
	       ;;
	    *)

	 echo -e "\e[1;33mInvalid Input.\e[0m"
	 exit 1
	 ;;
	esac

												#
		# ~~~~~~~~~~~~~									#
		# Balena Etcher									#
		# ~~~~~~~~~~~~~									#
        function etcher_repo {
        curl -1sLf \
           'https://dl.cloudsmith.io/public/balena/etcher/setup.deb.sh' \
           | sudo -E bash
        sudo apt update
        }


echo " "
read -p $'\e[1;37mInstall Balena Etcher? [Y/n]\e[0m' input
echo " "
case $input in
    [yY][eE][sS]|[yY])
		tput setaf 2
                sudo apt-get install balena-etcher-electron                                     #
		etcher_repo
 ;;
    [nN][oO]|[nN])
 echo -e "\e[1;33mBalena Etcher was not installed.\e[0m"
       ;;
    *)

 echo -e "\e[1;33mInvalid Input.\e[0m"
 exit 1
 ;;
esac

												#
		# ~~~~~~~~~~									#
		# Virtualbox									#
		# ~~~~~~~~~~									#

echo " "
read -p $'\e[1;37mInstall Virtualbox? [Y/n]\e[0m' input
echo " " 
case $input in
    [yY][eE][sS]|[yY])
tput setaf 2
                sudo apt install linux-headers-$(uname -r) dkms virtualbox                  #

 ;;
    [nN][oO]|[nN])
 echo -e "\e[1;33mVirtualbox was not installed.\e[0m"
       ;;
    *)

 echo -e "\e[1;33mInvalid Input.\e[0m"
 exit 1
 ;;
esac

												#
		# ~~~~~~~~~~~~~~~~~~~								#
		# Awesome WM programs								#
		# ~~~~~~~~~~~~~~~~~~~								#


echo " "
read -p $'\e[1;37mInstall Awesome WM programs? [Y/n]\e[0m' input
echo " "
case $input in
    [yY][eE][sS]|[yY])

tput setaf 2
                sudo apt install rofi rhythmbox
 ;;
    [nN][oO]|[nN])
echo -e "\e[1;33mAwesome WM programs were not installed.\e[0m"
       ;;
    *)
 echo -e "\e[1;33mInvalid Input.\e[0m"
 exit 1
 ;;
esac

												#
        # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~.

	# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~.
	# Configure mpd, xprofile, qlipper and  disable bluetooth at boot			                                                #
	# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~			                                                #
												                                                #
		# make git dir									                                                #
		mkdir -p ~/git									                                                #
												                                                #
		# set up mpd									                                                #
		mkdir -p ~/.local/share/playlists							                                                #
tput setaf 5
		sudo systemctl disable mpd							                                                #
		echo " "
		mpd ~/.config/mpd/mpd.conf							                                                #
		echo " "
										                                                #
		# xprofile									                                                #
		function xprofile_script {
		FILE=$HOME/.xprofile

		echo -e "\e[1;34m~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\e[0m"
		echo -e "\e[1;34m _       ()      \e[0m"
		echo -e "\e[1;34m((omputer||erms  \e[0m"
		echo -e "\e[1;34m        [_|      \e[0m"
		echo -e " "
		echo -e "\e[1;34mThis script checks if the file '~/.xprofile' exists...\e[0m"
		echo -e "\e[1;34mIt will add the string 'mpd &' to the existing file or\e[0m"
		echo -e "\e[1;34mcreate a new file '~/.xprofile' and add the string 'mpd &'\e[0m"
		echo " "
		echo -e "\e[1;33;1;41mNesccesary for MPD to autostart without opening a terminal.\e[0m"
		echo " "
		echo -e "\e[1;34m~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\e[0m"

echo " "
read -p $'\e[1;37mContinue? [Y/n]\e[0m' input
echo " "
		case $input in
		    [yY][eE][sS]|[yY])
		if [ -f $FILE ]; then
		   echo -e "\e[34mFile $FILE exists.\e[0m"
		   echo -e "\e[36mChecking if 'mpd &' exists in file ~/.xprofile\e[0m"
		   echo -e "\e[36mand adding it to the end if it does not exist.\e[0m"
		   if ! grep -q "mpd &" "$FILE"; then
		       echo "'mpd &' was not found in ~/.xprofile.. adding it now"
		   fi
		   grep -qxF 'mpd &' $FILE || echo 'mpd &' >> $FILE
		   echo -e "\e[1;33;4;44mDone.\e[0m"
		else
		   echo -e "\e[34mFile $FILE does not exist.\e[0m"
		   echo -e "\e[34mCreating file ~/.xprofile\e[0m"
		   touch ~/.xprofile
		   if ! grep -q "mpd &" "$FILE"; then
		   echo -e "\e[36m'mpd &' was not found in ~/.xprofile.. adding it now\e[0m"
		   fi
		   grep -qxF 'mpd &' $FILE || echo 'mpd &' >> $FILE
		   echo -e "\e[1;33;4;44mDone.\e[0m"
		fi
		 ;;
		    [nN][oO]|[nN])
		echo -e "\e[1;33mAborted ~/.xprofile configuration\e[0m"
		       ;;
		    *)
		   echo "Invalid input, exiting.."
		 exit 1
		 ;;
		esac
		}

		xprofile_script
#		$SRC/xprofile.sh								                                                #
												                                                #
		# Qlipper Settings								                                                #
		mkdir -p ~/.config/Qlipper							                                                #
#function qlipper_config {
		cat >> ~/.config/Qlipper/qlipper.ini<< EOF		                                                #
		[General]									                                                #
		clearItemsOnExit=false								                                                #
		confirmClear=true								                                                #
		displaySize=30									                                                #
		historyCount=10															#
		networkPort=6666								                                                #
		networkReceive=false								                                                #
		networkSend=false----								                                                #
		platformExtensions=false							                                                #
		shortcut=Alt+E									                                                #
		synchronizeHistory=true														#
		synchronizePSE=0														#
		tray_icon_file=~/.config/awesome/widgets/qlipper-icons/clipboard-red.png							#
		trim=true															#
EOF
															#
		sed -i 's/^ *//g' ~/.config/Qlipper/qlipper.ini											#
		sed -i "/tray_icon_file=/c\tray_icon_file=/home/"$USER"/files/images/Icons/clipboard-red.png" ~/.config/Qlipper/qlipper.ini	#
																		#
		# Disable Bluetooth at boot													#
																		#
		touch $SRC/bluetooth-disable-at-boot.service
		cat $SRC/bluetooth-disable-at-boot.service<< EOF
		[Unit]
		Description=Disable Bluetooth at boot

		[Service]
		Type=oneshot
		ExecStart=/usr/sbin/rfkill block bluetooth
		ExecStop=
		RemainAfterExit=yes

		[Install]
		WantedBy=multi-user.target
EOF
                sed -i 's/^ *//g' $SRC/bluetooth-disable-at-boot.service

                function disable_bluetooth {                                                                                                    #

echo " "
read -p $'\e[1;37mDisable Bluetooth at startup? [Y/n]\e[0m' input
echo " "                                                                                                                                                #
                case $input in                                                                                                                  #
                    [yY][eE][sS]|[yY])  

#		sed -i 's/^ *//g' $SRC/bluetooth-disable-at-boot.service
		sudo cp $SRC/bluetooth-disable-at-boot.service  /lib/systemd/system/								#
		sudo cp $SRC/bluetooth-disable-at-boot.service /etc/systemd/system/bluetooth-disable-at-boot.service				#
		sudo chmod 644 /etc/systemd/system/bluetooth-disable-at-boot.service								#
		tput setaf 5
		sudo systemctl enable --now bluetooth-disable-at-boot.service									#
		sudo systemctl daemon-reload
		sudo systemctl status bluetooth-disable-at-boot.service										#

		  ;;																#
		    [nN][oO]|[nN])														#
		echo -e "\e[1;33mBluetooth will continue to start at boot\e[0m"
		        ;;															#
		    *)																#
		  echo -e "\e[1;33mInvalid Input.\e[0m"													#
		  exit 1															#
		  ;;																#
		 esac																#
		}																#
		disable_bluetooth														#
		#$SRC/bt-disable.sh														#
																		#
	#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~.

	# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
	# Install packages from source								#							#   #   #
	# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~								#							#   #   #
												#							#   #   #
		# configure mictray								#							#   #   #
		function install_mictray {							#							#   #   #
echo " "
read -p $'\e[1;37mInstall Mictray? [Y/n]\e[0m' input
echo " "												#							#   #   #
			case $input in								#							#   #   #
			    [yY][eE][sS]|[yY])							#							#   #   #
tput setaf 2
		                mkdir -p ~/git                                                  #                                                       #   #   #
		                cd ~/git                                                        #                                                       #   #   #
		                git clone https://github.com/Junker/mictray                     #                                                       #   #   #
		                cd ~/git/mictray                                                #                                                       #   #   #
		                meson build --prefix=/usr                                       #                                                       #   #   #
		                cd build                                                        #                                                       #   #   #
		                ninja                                                           #                                                       #   #   #
		                sudo ninja install                                              #                                                       #   #   #
			 ;;									#							#   #   #
			    [nN][oO]|[nN])							#	 						#   #   #
        echo -e "\e[1;33mMicTray was not installed\e[0m"

			       ;;								#							#   #   #
			    *)									#							#   #   #
			 echo -e "\e[1;33mInvalid Input.\e[0m"						#							#   #   #
			 exit 1									#							#   #   #
			 ;;									#							#   #   #
			esac									#							#   #   #
			}									#							#   #   #
												#							#   #   #
		install_mictray									#							#   #   #
												#							#   #   #
		# configure fsearch								#							#   #   #
                function install_fsearch {							#							#   #   #
echo " "
read -p $'\e[1;37mInstall F-Search [Y/n]\e[0m' input
echo " "												#							#   #   #
                        case $input in								#							#   #   #
                            [yY][eE][sS]|[yY])							#							#   #   #
tput setaf 2
sudo apt install git build-essential automake autopoint autoconf libtool pkg-config intltool autoconf-archive libicu-dev libpcre3-dev libglib2.0-dev libgtk-3-dev libxml2-utils
	                cd ~/git && git clone https://github.com/cboxdoerfer/fsearch.git        #                                                       #   #   #
	                cd ~/git/fsearch && ./autogen.sh                                        #                                                       #   #   #
	                CC=clang CXX=clang++ ./configure                                        #                                                       #   #   #
        	        make && sudo make install 						#							#   #   #
                         ;;									#							#   #   #
                            [nN][oO]|[nN])							#							#   #   #
        echo -e "\e[1;33mF-Search was not installed.\e[0m"

                               ;;								#							#   #   #
                            *)									#							#   #   #
                         echo -e "\e[1;33mInvalid Input.\e[0m"						#							#   #   #
                         exit 1									#							#   #   #
                         ;;									#							#   #   #
                        esac									#							#   #   #
                        }									#							#   #   #
												#							#   #   #
                install_fsearch									#							#   #   #
												#							#   #   #


                # ~~~~~~~~                                                                      #
                # Deadbeef                                                                      #
                # ~~~~~~~~                                                                      #

echo " "
read -p $'\e[1;37mInstall Deadbeef Music Player? [Y/n]\e[0m' input
echo " " 
case $input in
    [yY][eE][sS]|[yY])

                        # Base                                                                  #
tput setaf 2
                        sudo apt install clang libdispatch-class-perl libblocksruntime0         #

 ;;
    [nN][oO]|[nN])
echo -e "\e[1;33mDeadbeef Music Player was not installed.\e[0m"
       ;;
    *)
 echo -e "\e[1;33mInvalid Input.\e[0m"
 exit 1
 ;;
esac

echo " "
read -p $'\e[1;37mInstall Plugins for Deadbeef? [Y/n]\e[0m' input
echo " " 
case $input in
    [yY][eE][sS]|[yY])

               # Plugins                                                               #
tput setaf 2
               sudo apt install libogg-dbg libjansson-dev libvorbis-dev libcurl4-gnutls-dev libjpeg-dev libmad-ocaml libflac-dev wavpack libsndfile-dev libcdio-dev libwavpack-dev libffmpeg-ocaml-dev libffmpegthumbnailer-dev libasound2 libasound2-dev xmms2-plugin-cdda libliquid2d libliquid-dev asterisk-opus libsamplerate-dev libcdio-cdda-dev libzip-dev libmp4-info-perl aac-enc libfaad-dev libcddb-dev libopusfile-dbg libmad0-dev libopusfile-dev
               #libmpd123-dev was removed from this list.. temporarily installed libghc-libmpd-dev

 ;;
    [nN][oO]|[nN])
        echo -e "\e[1;33mDeadbeef Plugins were not installed\e[0m"

       ;;
    *)
 echo -e "\e[1;33mInvalid Input.\e[0m"
 exit 1
 ;;
esac



		# configure Deadbeef Music Player						#							#   #   #
												#							#   #   #
                function install_deadbeef {							#							#   #   #
echo " "
read -p $'\e[1;37mInstall Deadbeef Music Player? [Y/n]\e[0m' input
echo " "												#							#   #   #
                        case $input in								#							#   #   #
                            [yY][eE][sS]|[yY])							#							#   #   #
tput setaf 2
	                cd ~/git && git clone https://github.com/DeaDBeeF-Player/deadbeef.git   #                                                       #   #   #
	                cd ~/git/deadbeef && git submodule update --init                        #                                                       #   #   #
                	./autogen.sh                                                            #                                                       #   #   #
        	        CC=clang CXX=clang++ ./configure --prefix=/usr                          #                                                       #   #   #
	                make -j5 && sudo make install						#							#   #   #
                         ;;									#							#   #   #
                            [nN][oO]|[nN])							#							#   #   #
        echo -e "\e[1;33mDeadbeef Music Player was not installed\e[0m"

                               ;;								#							#   #   #
                            *)									#							#   #   #
                         echo -e "\e[1;33mInvalid Input.\e[0m"						#							#   #   #
                         exit 1									#							#   #   #
                         ;;									#							#   #   #
                        esac									#							#   #   #
                        }									#							#   #   #
												#							#   #   #

                install_deadbeef								#							#   #   #
												#							#   #   #
												#							#
                        function install_veracrypt {						#							#
echo " "
read -p $'\e[1;37mInstall Veracrypt? [Y/n]\e[0m' input
echo " "                                                                                                #							#
                        case $input in                                                          #							#
                            [yY][eE][sS]|[yY])                                                  # 							#
                        # configure veracrypt                                                   #							#
tput setaf 2
                        cd ~/git && git clone https://github.com/veracrypt/VeraCrypt.git        #
                        cd ~/git/VeraCrypt/src && make                                          #
                        cd ~/git/VeraCrypt/src/Main && cp veracrypt ~/.local/bin                #
                        ;;                                                                      #
                            [nN][oO]|[nN])                                                      #
        echo -e "\e[1;33mVeracrypt was not installed\e[0m"
                               ;;                                                               #
                            *)                                                                  #
                         echo -e "\e[1;33mInvalid Input.\e[0m"                                                #
                         exit 1                                                                 #
                         ;;                                                                     #
                        esac                                                                    #
                        }                                                                       #
                                                                                                #
                        install_veracrypt							#
	#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~.							#   #   #
																			#   #   #
	# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~.											#   #   #
	# Clean up and reboot					#											#   #   #
	# ~~~~~~~~~~~~~~~~~~~					#											#   #   #
echo " "
echo -e "\e[1;34mUpgrading System\e[0m"
echo " "

#	sudo apt update && sudo apt dist-upgrade		#											#   #   #
tput setaf 2 && sudo apt update
tput setaf 2 && sudo apt dist-upgrade
tput setaf 2
	sudo apt autoremove					#											#   #   #
								#
	rm $SRC/runasroot.sh					#											#   #   #
#        rm $SRC/tempsources.list					#
	rm $SRC/bluetooth-disable-at-boot.service		#
#	rm $SRC/intel.list
#	rm $SRC/vbox_input.txt

	function reboot {					#
echo " "
read -p $'\e[1;37mReboot System Now? [Y/n]\e[0m' input
echo " "
        case $input in                                          #                                           #
            [yY][eE][sS]|[yY])					#
	sudo reboot						#											#   #   #
	 ;;                                                     #                                                   #
	    [nN][oO]|[nN])                                      #                                                  #
	 echo "You must reboot for changes to take effect."	#
	       ;;                                               #                                                   #
	    *)                                                  #                                                   #
	 echo -e "\e[1;33mInvalid Input.\e[0m"                                #                                                   #
	 exit 1                                                 #                                                   #
	 ;;                                                     #                                                   #
	esac							#
	}							#
								#
	reboot	 						#                                                   #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~.											#   #   #
																			#   #   #
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~SCRIPT-PROMPT-NO~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#   #	#
 ;;																			#   #	#
    [nN][oO]|[nN])																	#   #	#
 echo "Okay, good luck"																	#   #	#
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~SCRIPT-PROMPT-INVALID~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#	#
       ;;																			#
    *)																				#
echo -e "\e[1;33mInvalid input.\e[0m"
 exit 1																				#
 ;;																				#
esac																				#
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~SCRIPT-END~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
exit

