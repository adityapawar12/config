#!/bin/bash

# Styling variables
bold=$(tput bold)
underline=$(tput smul)
normal=$(tput sgr0)

echo
echo " >>>  UPDATING SYSTEM  <<< "
echo
sudo pacman -Sy
echo
echo " >>>  DONE  <<< "

echo
echo " >>>  UPGRADING SYSTEM  <<< "
echo
sudo pacman -Su --noconfirm
echo
echo " >>>  DONE  <<< "

echo
echo " >>>  CLEANING PACKAGE CACHE  <<< "
echo
sudo paccache -r
echo
echo " >>>  DONE  <<< "

# Check if yay is installed and install if not
if ! command -v yay &>/dev/null; then
    echo
    read -p "Yay is not installed. Do you want to install it? (y/n): " install_yay
    if [[ $install_yay == "y" || $install_yay == "Y" ]]; then
        echo
        echo " >>>  INSTALLING YAY  <<< "
        echo
        sudo pacman -S --needed git base-devel
        git clone https://aur.archlinux.org/yay.git
        cd yay
        makepkg -si
        cd ..
        rm -rf yay
        echo
        echo " >>>  YAY INSTALLED  <<< "
        echo
    fi
else
    echo
    echo " >>>  UPDATING YAY PACKAGES <<< "
    echo
    yay -Syu --noconfirm
    echo
    echo " >>>  DONE  <<< "
fi

# Check if flatpak is installed and install if not
if ! command -v flatpak &>/dev/null; then
    echo
    read -p "Flatpak is not installed. Do you want to install it? (y/n): " install_flatpak
    if [[ $install_flatpak == "y" || $install_flatpak == "Y" ]]; then
        echo
        echo " >>>  INSTALLING FLATPAK  <<< "
        echo
        sudo pacman -S --needed flatpak
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
        sudo pacman -S --needed snapd
        sudo systemctl enable --now snapd.socket
        sudo ln -s /var/lib/snapd/snap /snap
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
