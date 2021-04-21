#!/usr/bin/env bash

clear
echo
echo -e "\e[36m\e[1m   –––––––––––––––––––––––––––––––––––––––––––"
echo -e            "  | EFI+LVM GRUB2 fixer (by gustavosotnas) r1 |"
echo -e            "   –––––––––––––––––––––––––––––––––––––––––––\e[0m"
echo
echo -e "\e[1mThis script do or undo the forced 30 seconds on GRUB 2 installed"
echo "on Linux systems with EFI boot in logical partitions (LVM)."
echo
echo "If this script is run and that 30 seconds is forced, this script will"
echo "turn off the forcing. Otherwise, this script will turn it on back."
echo -e "\e[0m"

sleep 2
echo "Checking if the script is running as root..."
sleep 1

if [[ $EUID -ne 0 ]]
then
    echo
    echo -e "\e[91m\e[1mERROR: This script must be run as root (sudo)!\e[0m"
    echo
    exit 1
fi

echo "OK"
echo
echo "Detecting GRUB 2..."
sleep 0.5

grubFile="/etc/grub.d/00_header"

if [ ! -f $grubFile ] && which update-grub >/dev/null
then
    echo
    echo -e "\e[91m\e[1mERROR: GRUB 2 not detected! This can not continue!\e[0m"
    echo
    exit 1
fi

echo "OK"

if grep -q "recordfail_broken=1" $grubFile
then
    echo
    echo "[1/2] Fixing GRUB 2..."
    sleep 2
    sed -i "/recordfail_broken=/{s/1/0/}" $grubFile
    echo "OK"
else
    echo
    echo "[1/2] Undoing GRUB 2 fix..."
    sleep 2
    sed -i "/recordfail_broken=/{s/0/1/}" $grubFile
    echo "OK"
fi

echo
echo "[2/2] Updating GRUB 2..."
update-grub

echo
echo -e "\e[1mRESTART YOUR COMPUTER to apply the changes.\e[0m"
echo
