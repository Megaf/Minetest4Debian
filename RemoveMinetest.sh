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
WAIT=15

clear
echo "||==============================================================================================================||"
echo "||	Hi, this is a script for Linux that will remove Minetest and it's games.				||" 
echo "||	Minetest will be removed from $(echo ~)/Minetest.							||"
echo "||	Press ctrl + c at any moment to cancel this script.							||"
echo "||==============================================================================================================||"
echo "||	Press ctrl + c to cancel or wait 15 seconds to continue.						||"
echo "||==============================================================================================================||"
sleep $WAIT

echo "||====== Removing Minetest"
rm -rf ~/Minetest
echo "||====== Done."