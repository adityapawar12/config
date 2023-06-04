#!/bin/bash

bold=$(tput bold)
underline=$(tput smul)
normal=$(tput sgr0)

echo
echo " >>>  WELCOME  <<< "
read -p "${normal} >>>  DO YOU WANT TO RUN POST INSTALL SCRIPT? (Y/N) :  <<< ${normal}" choice
echo

if [[ $choice == "y" || $choice == "Y" ]]; then
    echo "${normal} >>>  RUNNING POST INSTALL SCRIPT  <<< ${normal}"
    echo

    if command -v pacman >/dev/null 2>&1; then
        chmod +x "arch/start.sh"
        (cd "arch" && ./start.sh)
    elif command -v apt >/dev/null 2>&1; then
        chmod +x "deb/start.sh"
        (cd "deb" && ./start.sh)
    else
        echo "Unsupported distribution."
    fi
    
    echo
    echo "${normal} >>>  POST INSTALL SCRIPT COMPLETED  <<< ${normal}"
else
    echo "${normal} >>>  SKIPPING POST INSTALL SCRIPT  <<< ${normal}"
fi