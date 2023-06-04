#!/bin/bash

# Styling variables
bold=$(tput bold)
underline=$(tput smul)
normal=$(tput sgr0)

echo
echo "${bold} >>>  DEBIAN BASED DISTRIBUTION DETECTED ${normal}  <<< "
echo

echo
echo " >>>  UPDATING SYSTEM  <<< "
echo
sudo apt update
echo
echo " >>>  DONE  <<< "

echo
echo " >>>  UPGRADING SYSTEM  <<< "
echo
sudo apt upgrade -y
echo
echo " >>>  DONE  <<< "

echo
echo " >>>  CLEANING PACKAGE CACHE  <<< "
echo
sudo apt autoclean
sudo apt autoremove -y
echo
echo " >>>  DONE  <<< "

# Check if flatpak is installed and install if not
if ! command -v flatpak &>/dev/null; then
    echo
    read -p "Flatpak is not installed. Do you want to install it? (y/n): " install_flatpak
    if [[ $install_flatpak == "y" || $install_flatpak == "Y" ]]; then
        echo
        echo " >>>  INSTALLING FLATPAK  <<< "
        echo
        sudo apt install flatpak -y
        echo
        echo " >>>  FLATPAK INSTALLED  <<< "
        echo
    fi
else
    echo
    echo " >>>  UPDATING FLATPAK PACKAGES <<< "
    echo
    flatpak update -y
    echo
    echo " >>>  DONE  <<< "
fi

# Check if snap is installed and install if not
if ! command -v snap &>/dev/null; then
    echo
    read -p "Snap is not installed. Do you want to install it? (y/n): " install_snap
    if [[ $install_snap == "y" || $install_snap == "Y" ]]; then
        echo
        echo " >>>  INSTALLING SNAP  <<< "
        echo
        sudo apt install snapd -y
        sudo snap install core
        sudo apt-mark snapd
        sudo snap refresh
        echo
        echo " >>>  SNAP INSTALLED  <<< "
        echo
    fi
else
    echo
    echo " >>>  UPDATING SNAP PACKAGES <<< "
    echo
    sudo snap refresh
    echo
    echo " >>>  DONE  <<< "
fi

echo
echo " >>>  SYSTEM UPDATE AND UPGRADE COMPLETED!  <<< "
echo
