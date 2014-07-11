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

clear
echo "||==============================================================================================================||"
echo "||	Hi, this is a script for Linux that will update to the latest Minetest source code and it's games.	||" 
echo "||	It will re-compile Minetest for you too.							   	||"
echo "||	Minetest will be installed at $(echo ~)/Minetest.							||"
echo "||	Please, run InstallMinetest.sh before running this script. Otherwise, this script will fail!		||"
echo "||	Press ctrl + c at any moment to cancel this script.							||"
echo "||==============================================================================================================||"
echo "||	Press ctrl + c to cancel or wait 15 seconds to continue.						||"
echo "||==============================================================================================================||"
sleep 1

cd $INSTALLDIR/Minetest/

git pull
  cd games/
     cd minetest_game
      git pull
      cd ..
     cd Pixel
      git pull
      cd ..
     cd RPi
     git pull
     cd ..
   cd ..
   
make -j $CORESCOUNT


cd $INSTALLDIR/Minetest
echo "||========= Your Minetest is installed in $(pwd)."
echo "||========= All done! Type ./bin/minetest and press enter to run Minetest!"