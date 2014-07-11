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


INSTALLDIR=~
CORESCOUNT=$(cat /proc/cpuinfo | grep 'core id' | wc -l)
# INSTALLDIR=/tmp
WAIT=15

clear
echo "||==============================================================================================================||"
echo "||	Hi, this is a script for Linux that will download the latest Minetest source code and it's games.	||" 
echo "||	It will compile Minetest for you too.								   	||"
echo "||	Minetest will be installed at $(echo ~)/Minetest.							||"
echo "||	Please, run InstallDependencies.sh before running this script. Otherwise, this script will fail!	||"
echo "||	Press ctrl + c at any moment to cancel this script.							||"
echo "||==============================================================================================================||"
echo "||	Press ctrl + c to cancel or wait $WAIT seconds to continue.						||"
echo "||==============================================================================================================||"
sleep $WAIT

cd $INSTALLDIR
  echo "||========= Downloading Minetest Source Code. From https://github.com/minetest/minetest"
  git clone https://github.com/minetest/minetest.git Minetest
   cd Minetest 
    cd games
    echo "||========= Downloading the default Minetest game from Minetest. From https://github.com/minetest/minetest_game"
    git clone https://github.com/minetest/minetest_game.git
    echo "||========= Downloading a PiXel Art game for Minetest. From https://github.com/Megaf/Pixel"
    git clone https://github.com/Megaf/Pixel.git
    echo "||========= Downloading a lightweight game for Minetest. From https://github.com/Megaf/RPi"
    git clone https://github.com/Megaf/RPi.git
    cd ..
    
    echo "||========= Preparing Minetest to be compiled."
    cmake . -DRUN_IN_PLACE=1 -DENABLE_FREETYPE=1 -DENABLE_LEVELDB=0 -DENABLE_REDIS=0 -DVERSION_EXTRA=Minetest4Debian
#   make -j $(cat /proc/cpuinfo | grep 'core id' | wc -l)
    echo "||========= Compiling Minetest."
    make -j $CORESCOUNT
    
   
   echo "||========= Creating Minetest basic and fast and light configuration. (minetest.conf)"
   touch minetest.conf
   echo "wanted_fps = 30" >> minetest.conf
   echo "fps_max = 30" >> minetest.conf
   echo "pause_fps_max = 35" >> minetest.conf
   echo "viewing_range_nodes_max = 50" >> minetest.conf
   echo "viewing_range_nodes_min = 50" >> minetest.conf
   echo "enable_fog = false" >> minetest.conf
   echo "enable_3d_clouds = false" >> minetest.conf
   echo "preload_item_visuals = false" >> minetest.conf
   echo "enable_shaders = false" >> minetest.conf
   echo "curl_timeout = 2000" >> minetest.conf
   echo "curl_parallel_limit = 4" >> minetest.conf
   echo "menu_clouds = false" >> minetest.conf
   echo "fall_bobbing_amount = 1.0" >> minetest.conf
   echo "client_unload_unused_data_timeout = 60" >> minetest.conf
   
   #   make install
   
#  cd ..
  cd $INSTALLDIR/Minetest
  echo "||========= Your Minetest is installed in $(pwd)."
  echo "||========= All done! Type ./bin/minetest and press enter to run Minetest!"
#  rm -rf /tmp/Minetest