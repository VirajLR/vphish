#!/bin/bash

DISTRO=$(uname -o)

if [ $DISTRO == Android ]; then
	export VPHISH_ROOT="/data/data/com.termux/files/usr/opt/vphish"
else
	export VPHISH_ROOT="/usr/opt/vphish"
fi

cd $VPHISH_ROOT
bash ./vphish.sh
