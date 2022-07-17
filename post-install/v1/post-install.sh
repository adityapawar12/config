#!/bin/bash

########################################################################
#                       PATTERN FUNCTIONS
########################################################################
function showPuzzleTopPattern() {
echo "
 _______________________________________________________________________
|       (_      (_      (_      (_      (_      (_      (_      (_      |
|        _)      _)      _)      _)      _)      _)      _)      _)     |
|  _   _(  _   _(  _   _(  _   _(  _   _(  _   _(  _   _(  _   _(  _   _|
|_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |
"
}

function showPuzzleBottomPattern() {
echo "
| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_|
|       (_      (_      (_      (_      (_      (_      (_      (_      |
|        _)      _)      _)      _)      _)      _)      _)      _)     |
|_______(_______(_______(_______(_______(_______(_______(_______(_______|
"
}

function showBrickPattern() {
echo "
_|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|
___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|__
_|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|
"
}

function showPlusPattern() {
echo "
_|_     _|_     _|_     _|_     _|_     _|_     _|_     _|_     _|_   
 |       |       |       |       |       |       |       |       |    
"
}

########################################################################
#                       DISTRO FUNCTIONS
########################################################################
function getDistro() {
    echo $(uname -r | grep -oi 'manjaro\|ubuntu')
}

########################################################################
#                       ARCH FUNCTIONS
########################################################################
function updateArch() {
    showPlusPattern; 
    printf "                               UPDATE\n"; 
    showPlusPattern; 
    while true; do
        read -p "Do you want to update your system[yne]? " yne 
        case $yne in
            [Yy]* ) printf ">          RUNNING : sudo pacman -Syy          <\n"; 
                    sudo pacman -Syy; 
                    break;;
            [Nn]* ) break;;
            [Ee]* ) exit;;
            * ) echo "Please answer y or n or e.";;
        esac
    done
}

function upgradeArch() {
    showPlusPattern; 
    printf "                               UPGRADE\n"; 
    showPlusPattern; 
    while true; do
        read -p "Do you want to upgrade your system[yne]? " yne 
        case $yne in
            [Yy]* ) printf ">          RUNNING : sudo pacman -Syu          <\n"; 
                    sudo pacman -Syu; 
                    break;;
            [Nn]* ) break;;
            [Ee]* ) exit;;
            * ) echo "Please answer y or n or e.";;
        esac
    done
}

function installSnapAndFlatpakArch() {
    showPlusPattern; 
    printf "                               SNAP AND FLATPAK\n"; 
    showPlusPattern; 
    while true; do
        read -p "Do you want to install snap and flatpak[yne]? " yne 
        case $yne in
            [Yy]* ) printf ">          RUNNING : sudo pacman -S snapd          <\n"; 
                    sudo pacman -S snapd flatpak; 
                    sudo systemctl enable --now snapd.socket; 
                    sudo ln -s /var/lib/snapd/snap /snap;
                    break;;
            [Nn]* ) break;;
            [Ee]* ) exit;;
            * ) echo "Please answer y or n or e.";;
        esac
    done
}

function installArchPrograms() {
    showPlusPattern; 
    printf "                               INSTALL\n"; 
    showPlusPattern; 
    installSnapAndFlatpakArch
    while true; do
        read -p "Do you want to install programs[yne]? " yne 
        case $yne in
            [Yy]* ) printf ">          RUNNING : sudo pacman -S          <\n"; 
                    sudo pacman -S vlc; 
                    break;;
            [Nn]* ) break;;
            [Ee]* ) exit;;
            * ) echo "Please answer y or n or e.";;
        esac
    done
}

########################################################################
#                       DEBIAN FUNCTIONS
########################################################################
function updateDebian() {
    showPlusPattern; 
    printf "                               UPDATE\n"; 
    showPlusPattern; 
    while true; do
        read -p "Do you want to update your system[yne]? " yne 
        case $yne in
            [Yy]* ) printf ">          RUNNING : sudo apt update          <\n"; 
                    sudo apt update; 
                    break;;
            [Nn]* ) break;;
            [Ee]* ) exit;;
            * ) echo "Please answer y or n or e.";;
        esac
    done
}

function upgradeDebian() {
    showPlusPattern; 
    printf "                               UPGRADE\n"; 
    showPlusPattern; 
    while true; do
        read -p "Do you want to upgrade your system[yne]? " yne 
        case $yne in
            [Yy]* ) printf ">          RUNNING : sudo apt upgrade          <\n"; 
                    sudo apt upgrade; 
                    break;;
            [Nn]* ) break;;
            [Ee]* ) exit;;
            * ) echo "Please answer y or n or e.";;
        esac
    done
}

function installSnapAndFlatpakDebian() {
    showPlusPattern; 
    printf "                               SNAP AND FLATPAK\n"; 
    showPlusPattern; 
    while true; do
        read -p "Do you want to install snap and flatpak[yne]? " yne 
        case $yne in
            [Yy]* ) printf ">          RUNNING : sudo apt install snapd flatpak          <\n"; 
                    sudo apt install snapd flatpak gnome-software-plugin-flatpak; 
                    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo;
                    sudo snap install core;
                    break;;
            [Nn]* ) break;;
            [Ee]* ) exit;;
            * ) echo "Please answer y or n or e.";;
        esac
    done
}

function installDebianPrograms() {
    showPlusPattern; 
    printf "                               INSTALL\n"; 
    showPlusPattern; 
    installSnapAndFlatpakDebian   
    while true; do
        read -p "Do you want to install programs[yne]? " yne 
        case $yne in
            [Yy]* ) printf ">          RUNNING : sudo apt install          <\n"; 
                    sudo apt install vlc; 
                    break;;
            [Nn]* ) break;;
            [Ee]* ) exit;;
            * ) echo "Please answer y or n or e.";;
        esac
    done
}

########################################################################
#                       EXECUTION OF FUNCTIONS 
########################################################################
distro=$(getDistro)
showPuzzleTopPattern
echo "         THE POST INSTALL SCRIPT ON $distro IS INITIALISED"
showPuzzleBottomPattern

#CHECK WHICH DISTRO YOU ARE USING.
if [ "${distro,,}" == "manjaro" ];
then
    showBrickPattern
    printf "                      ARCH BASED SYSTEM\n"
    showBrickPattern
    updateArch
    upgradeArch
    installArchPrograms
elif [ "${distro,,}" == "ubuntu" ];
then
    showBrickPattern
    printf "                     DEBIAN BASED SYSTEM\n"
    showBrickPattern
    updateDebian
    upgradeDebian
    installDebianPrograms
fi
