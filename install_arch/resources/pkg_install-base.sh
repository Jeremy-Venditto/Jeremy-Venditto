#!/bin/bash

  YUM_CMD=$(which yum) > /dev/null 2>&1
  APT_GET_CMD=$(which apt-get) > /dev/null 2>&1
  PACMAN_CMD=$(which pacman) > /dev/null 2>&1

 if [[ ! -z $YUM_CMD ]]; then
    yum install firefox > /dev/null 2>&1
elif [[ ! -z $APT_GET_CMD ]]; then
    apt-get firefox > /dev/null 2>&1
 elif [[ ! -z $PACMAN_CMD ]]; then
    sudo pacman -S firefox
 else
    echo "error can't install package $PACKAGE"
    exit 1;
 fi
