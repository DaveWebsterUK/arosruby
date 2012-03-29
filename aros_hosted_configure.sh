#!/bin/bash

# Set this variable to point to your AROS hosted system directory
aros_dir="/home/david/Downloads/AROS-20120323-linux-i386-system"
aros_gcc="/home/david/Downloads/AROS-20120323-source/bin/linux-i386/tools/crosstools/i386-aros-gcc"

if [ $aros_dir = "NULL" ]; then
	echo "**************************************************"
	echo "Please edit this file to set the aros_dir to point" 
	echo "to your aros system directory.                    "
	echo "**************************************************"

else 

        echo "**************************************************"
	echo "Your AROS system directory is \""$aros_dir\"
        echo "**************************************************"

	CC=$aros_gcc" -nix" CC_FOR_BUILD=gcc ./configure --target=i386-pc-aros --host=i386-pc-aros --build=i386-pc-linux --prefix=$aros_dir"/Development" --disable-shared --with-static-linked-ext

# LIBS="-lmui"

fi 



