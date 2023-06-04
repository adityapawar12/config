#!/bin/bash

# Styling variables
bold=$(tput bold)
underline=$(tput smul)
normal=$(tput sgr0)

echo
echo "${bold} >>>  ARCH BASED DISTRIBUTION DETECTED ${normal}  <<< "
echo

# Display menu options
echo
echo "${bold} >>>  PLEASE SELECT AN OPTION ${normal}  <<< "
echo
echo "${normal} >>>  1. UPDATE AND UPGRADE SYSTEM ${normal} "
echo "${normal} >>>  9.EXIT ${normal} "

echo
read -p "${bold} >>>  ENTER YOUR CHOISE(1-9): " choice
echo

# Execute selected option
case $choice in
    1)
        chmod +x "update-upgrade-system.sh"
        ./update-upgrade-system.sh
        ;;
    9)
        echo "${bold} >>>  EXITING ${normal}  <<< "
        exit 0
        ;;
    *)
        echo "${bold} >>>  INVALID CHOICE. EXITING ${normal}  <<< "
        exit 1
        ;;
esac