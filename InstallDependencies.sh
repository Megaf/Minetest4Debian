#!/bin/bash

## License ##
#
# GNU GENERAL PUBLIC LICENSE
#
# Version 2, June 1991
#
# Copyright (C) Megaf Info.  
# http://megaf.info/ and http://megafs.wordpress.com/
#
# Everyone is permitted to copy and distribute verbatim copies
# of this license document, but changing it is not allowed.
#
# http://www.gnu.org/licenses/gpl-2.0.html
##


clear
echo "||==============================================================================================||"
echo "||	Hi, this script will install all packages you need to run				||"
echo "||	The latest version of Minetest on your Debian.						||"
echo "||	Please note, you must run this as root. It wont install anything you don't want.	||"
echo "||	It will ask for your permission to install all packages.				||"
echo "||==============================================================================================||"
echo "||	Press ctrl + c to cancel or wait 15 seconds to continue.				||"
echo "||==============================================================================================||"
sleep 15

clear
echo "||======= Updating the list of available software for your system."

sleep 2

apt-get update

echo "||======= Installing dependencies."
sleep 2
apt-get install build-essential git libirrlicht-dev cmake libbz2-dev libpng12-dev libjpeg8-dev 
apt-get install libxxf86vm-dev libgl1-mesa-dev libsqlite3-dev libogg-dev libvorbis-dev libopenal-dev 
apt-get install libcurl4-gnutls-dev libfreetype6-dev libleveldb-dev libhiredis-dev

echo "||======= All done, hopefully, you can now type (exit) and then (sh InstallMinetest.sh)"

