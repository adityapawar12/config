#!/bin/bash

# Styling variables
bold=$(tput bold)
underline=$(tput smul)
normal=$(tput sgr0)

echo "${normal}Welcome to the post-install script!${normal}"
read -p "${normal}Do you want to run the post-install script? (y/n): ${normal}" choice
echo

if [[ $choice == "y" || $choice == "Y" ]]; then
    echo "${normal}Running post-install script...${normal}"
    echo

    if command -v pacman >/dev/null 2>&1; then
        chmod +x "arch/start.sh"  # Grant execute permissions to start.sh
        (cd "arch" && ./start.sh)
    elif command -v apt >/dev/null 2>&1; then
        chmod +x "deb/start.sh"  # Grant execute permissions to start.sh
        (cd "deb" && ./start.sh)
    else
        echo "Unsupported distribution."
    fi
    
    echo
    echo "${bold}Post-install script completed.${normal}"
else
    echo "${bold}Skipping post-install script.${normal}"
fi