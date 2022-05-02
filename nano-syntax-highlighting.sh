#!/bin/bash

#find /usr/share/nano/ -iname "*.nanorc" -exec echo include {} \; >> ~/.nanorc

find /usr/share/nano -name '*.nanorc' -printf "include %p\n" >> ~/.nanorc
