#!/bin/bash

# Set this variable to point to your AROS hosted system directory
aros_dir="NULL"


if [ $aros_dir = "NULL" ]; then
	echo "**************************************************"
	echo "Please edit this file to set the aros_dir to point" 
	echo "to your aros system directory.                    "
	echo "**************************************************"

else 

        echo "**************************************************"
	echo "Your AROS system directory is \""$aros_dir\"
        echo "**************************************************"

	CC='i386-aros-gcc -nix' CC_FOR_BUILD=gcc ./configure --target=i386-pc-aros --host=i386-pc-aros --build=i386-pc-linux --prefix=$aros_dir"/Development" --disable-shared LIBS="-lmui"

fi 



