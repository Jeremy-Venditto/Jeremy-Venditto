#!/bin/bash

SCRDIR=$PWD

read -r -p "Do you want to remove installation files? [Y/n] " input

case $input in
    [yY][eE][sS]|[yY])

rm -rf $SCRDIR
echo "Items Removed"
echo "Thank you for using Jerms' Script"

 ;;
    [nN][oO]|[nN])

echo "Files have been kept"
echo "Thank you for using Jerms' Script"

       ;;
    *)
 echo "Invalid input..."
 echo "Files have been kept"
 exit 1
 ;;
esac
