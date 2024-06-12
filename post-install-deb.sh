#!/bin/bash

# Functions 

function updateDebian() {
    echo "${bold}Updating System${normal}"
    sudo apt update
}

function upgradeDebian() {
    echo "${bold}Updating and Upgrading System${normal}"
    sudo apt upgrade
}

function installSnapAndFlatpakDebian() {
    echo "${bold}Installing snap and flatpak${normal}"
    sudo apt install snapd flatpak gnome-software-plugin-flatpak
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    sudo snap install core
}

function installDebianPrograms() {
    echo "${bold}Installing programs${normal}"
    sudo apt -y install vlc firefox alacritty qbittorrent kdeconnect brave-browser code p7zip-full audacious elisa filelight vim neovim neovim-qt vim-gtk htop libreoffice lshw okular telegram-desktop rxvt-unicode
    flatpak install flathub org.onlyoffice.desktopeditors
    flatpak install flathub md.obsidian.Obsidian
    flatpak install flathub com.google.Chrome
}

# Functions 

bold=$(tput bold)
normal=$(tput sgr0)
green=$(tput setaf 2)
blue=$(tput setaf 4)

echo ""
echo "${bold}Post install script${normal}"
echo ""

function debianSetup() {
    echo "${green}Debian Linux Setup.${normal}"
    echo "${green}Choose an option:${normal}"
   
    # Options
    options=("Update System" "Update & Upgrade System" "Basic Post Install Setup" "Exit")
    for i in "${!options[@]}"; do
        echo "$((i+1)). ${options[$i]}"
    done

    # User Input
    echo ""
    read -p "${blue}Enter your choice: ${normal}" choice

    # Execute corresponding bash script based on user input
    echo ""
    case $choice in
        1)
            echo "${bold}Updating System${normal}"
            updateDebian
            ;;
        2)
            echo "${bold}Updating and Upgrading System${normal}"
            upgradeDebian
            ;;
        3) 
            echo "${bold}Running Basic Post Install Setup${normal}" 
            chmod +x ./auto-fs.sh
            ./auto-fs.sh
            ;;
        7) 
            echo "${bold}Exiting...${normal}"; 
            exit ;;
        *) 
            echo "${bold}Invalid choice. Please enter a number from 1 to 4.${normal}" ;;
    esac
}

debianSetup

# extra functions
# function installI3OnDebian() {
#     echo "${bold}Installing i3 WM${normal}"
#     sudo apt install i3 xorg xorg dmenu i3status i3lock ttf-dejavu suckless-tools lightdm 
# }