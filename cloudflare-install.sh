#!/bin/sh
echo "*** POWERED BY VIRAJ LR ***"

echo "--upgrading packages"
yes "" | pkg update

echo "-- installing dependancies: golang git debianutils make"
yes "" | pkg install openssh golang git debianutils make

echo "-- downloading cloudflared source"
git clone https://github.com/cloudflare/cloudflared.git --depth=1
cd cloudflared
sed -i 's/linux/android/g' Makefile

echo "-- building and installing cloudflared"
make cloudflared
install cloudflared /data/data/com.termux/files/usr/bin

echo "*** Cloudflare Successfully Installed ***"
