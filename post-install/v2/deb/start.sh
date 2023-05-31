#!/bin/bash

# Styling variables
bold=$(tput bold)
underline=$(tput smul)
normal=$(tput sgr0)

echo "${bold}Debian-based distribution detected.${normal}"
echo "${bold}Executing Debian-specific commands...${normal}"