#!/bin/bash

# Functions 

function updateArch() {
    echo "${bold}Updating System${normal}"
    sudo pacman -Syy
}

function upgradeArch() {
    echo "${bold}Updating and Upgrading System${normal}"
    sudo pacman -Syyu
}

function installSnapAndFlatpakAndAurArch() {
    echo "${bold}Snap Flatpak AUR Setup${normal}"
    
    # Check if Yay is installed
    if ! command -v yay &> /dev/null; then
        # AUR
        sudo sed -Ei '/EnableAUR/s/^#//' /etc/pamac.conf
        git clone https://aur.archlinux.org/yay.git
        cd yay
        makepkg -si --asroot=false
        cd ..
        rm -rf yay
        yay --version
    else
        echo "Yay is already installed."
    fi

    # Check if Flatpak is installed
    if ! command -v flatpak &> /dev/null; then
        # Flatpak
        sudo pacman --needed -S flatpak
    else
        echo "Flatpak is already installed."
    fi

    # Check if Snap is installed
    if ! command -v snap &> /dev/null; then
        # Snaps
        sudo pacman --needed -S snapd 
        sudo systemctl enable --now snapd.socket
        sudo ln -s /var/lib/snapd/snap /snap
    else
        echo "Snap is already installed."
    fi
}

function install_packages() {
    local packages=("$@")
    
    for pkg in "${packages[@]}"; do
        if ! pacman -Qs "$pkg" &>/dev/null; then
            sudo pacman -S --needed --noconfirm "$pkg"
        else
            echo "$pkg is already installed."
        fi
    done
}

function uninstall_packages() {
    local packages=("$@")
    
    for pkg in "${packages[@]}"; do
        if pacman -Qs "$pkg" &>/dev/null; then
            sudo pacman -Runs --noconfirm "$pkg"
        else
            echo "$pkg is not installed."
        fi
    done
}

function installArchPrograms() {

    # AMD GPU
    amd_gpu_packages=("lib32-mesa" "vulkan-radeon" "lib32-vulkan-radeon" "vulkan-icd-loader" "lib32-vulkan-icd-loader")
    install_packages "${amd_gpu_packages[@]}"

    # BASIC
    basic_packages=("vlc" "firefox" "alacritty" "kdeconnect" "p7zip" "audacious" "vim" "neovim" "htop" "lshw" "okular")
    install_packages "${basic_packages[@]}"
    
    # yay -S --needed --noconfirm google-chrome

    # CODING
    coding_packages=("nodejs" "npm" "dbeaver" "godot" "kate" "base-devel" "git")
    install_packages "${coding_packages[@]}"

    # yay visual-studio-code-bin android-studio

    # RUST
    if ! command -v rustc &>/dev/null; then
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
        rustc --version
    else
        echo "Rust is already installed."
    fi

    # GAMING
    gaming_packages=("wine" "winetricks" "wine-mono" "wine-gecko" "steam" "linux-steam-integration" "steam-native-runtime" "gamemode" "lib32-gamemode" "mangohud" "lib32-mangohud")
    install_packages "${gaming_packages[@]}"

    # flatpak install flathub com.valvesoftware.Steam
    # yay -S --needed --noconfirm vkbasalt lib32-vkbasalt goverlay-bin protonup-qt

    # MUSIC PROD
    music_prod_packages=("ardour" "audacity" "lmms" "helm" "surge-xt")
    install_packages "${music_prod_packages[@]}"

    # yay -S --needed --noconfirm vital-synth reaper tracktion-waveform

    # GRAPHICS
    graphics_packages=("inkscape" "blender" "gimp" "kdenlive")
    install_packages "${graphics_packages[@]}"
}

function uninstallAmdGpuArchPrograms() {
    amd_gpu_packages=("lib32-mesa" "vulkan-radeon" "lib32-vulkan-radeon" "vulkan-icd-loader" "lib32-vulkan-icd-loader")
    uninstall_packages "${amd_gpu_packages[@]}"

}

function uninstallBasicArchPrograms() {
    basic_packages=("vlc" "firefox" "alacritty" "kdeconnect" "p7zip" "audacious" "vim" "neovim" "htop" "lshw" "okular")
    uninstall_packages "${basic_packages[@]}"
    
    # yay -S --needed --noconfirm google-chrome

}

function uninstallCodingPrograms() {

    coding_packages=("nodejs" "npm" "dbeaver" "godot" "kate" "base-devel" "git")
    uninstall_packages "${coding_packages[@]}"

    # yay visual-studio-code-bin android-studio


}

function uninstallRustArchProgram() {

    # RUST
    if ! command -v rustc &>/dev/null; then
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
        rustc --version
    else
        echo "Rust is already installed."
    fi


}

function uninstallGamingArchPrograms() {

    # GAMING
    gaming_packages=("wine" "winetricks" "wine-mono" "wine-gecko" "steam" "linux-steam-integration" "steam-native-runtime" "gamemode" "lib32-gamemode" "mangohud" "lib32-mangohud")
    uninstall_packages "${gaming_packages[@]}"

    # flatpak install flathub com.valvesoftware.Steam
    # yay -S --needed --noconfirm vkbasalt lib32-vkbasalt goverlay-bin protonup-qt



}

function uninstallMusicProdArchPrograms() {

    # MUSIC PROD
    music_prod_packages=("ardour" "audacity" "lmms" "helm" "surge-xt")
    uninstall_packages "${music_prod_packages[@]}"

    # yay -S --needed --noconfirm vital-synth reaper tracktion-waveform


}

function uninstallGraphicsArchPrograms() {

    # GRAPHICS
    graphics_packages=("inkscape" "blender" "gimp" "kdenlive")
    uninstall_packages "${graphics_packages[@]}"

}
# Functions 

bold=$(tput bold)
normal=$(tput sgr0)
green=$(tput setaf 2)
blue=$(tput setaf 4)

echo ""
echo "${bold}Post install script${normal}"
echo ""

# function archSetup() {
#     echo "${bold}${green}Arch Linux Setup.${normal}"
#     echo "${green}Select Action:${normal}"

#     # Options
#     options=("Update System" "Update & Upgrade System" "Create FS" "Setup Flatpak Snap and AUR" "Basic Post Install Setup" "Uninstall Music Prod Apps" "Uninstall Graphic Apps" "Exit")
#     for i in "${!options[@]}"; do
#         echo "$((i+1)). ${options[$i]}"
#     done

#     # User Input
#     echo ""
#     read -p "${blue}Enter your choice:${normal}" choice

#     # Execute corresponding bash script based on user input
#     echo ""
#     case $choice in
#         1)
#             echo "${bold}Updating System${normal}"
#             sudo pacman -Syy
#             echo "${bold}Done.${normal}"
#             ;;
#         2)
#             echo "${bold}Updating and Upgrading System${normal}"
#             sudo pacman -Syyu
#             echo "${bold}Done.${normal}"
#             ;;
#         3) 
#             echo "${bold}Creating FS${normal}"
#             chmod +x ./auto-fs.sh
#             ./auto-fs.sh
#             echo "${bold}Done.${normal}"
#             ;;
#         4)
#             echo "${bold}Setup Flatpak Snap and AUR${normal}"
#             installSnapAndFlatpakAndAurArch
#             echo "${bold}Done.${normal}"
#             ;;
#         5) 
#             echo "${bold}Running Basic Post Install Setup${normal}"
#             chmod +x ./auto-fs.sh
#             ./auto-fs.sh
#             upgradeArch
#             installSnapAndFlatpakAndAurArch
#             installArchPrograms
#             echo "${bold}Done.${normal}"
#             ;;
#         6) 
#             echo "${bold}Uninstall Music Prod Apps${normal}"; 
#             uninstallMusicProdArchPrograms
#             exit ;;
#         6) 
#             echo "${bold}Uninstalling Graphics Programs${normal}"; 
#             uninstallGraphicsArchPrograms
#             exit ;;
#         7) 
#             echo "${bold}Exiting...${normal}"; 
#             exit ;;
#         *) 
#             echo "${bold}Invalid choice. Please enter a number from 1 to 4.${normal}" ;;
#     esac
# }
function archSetup() {
    echo "${bold}${green}Arch Linux Setup.${normal}"
    echo "${green}Select Action:${normal}"

    # Options
    options=("Update System" "Update & Upgrade System" "Create FS" "Setup Flatpak Snap and AUR" "Basic Post Install Setup" "Uninstall Music Prod Apps" "Uninstall Graphic Apps" "Uninstall AMD GPU related programs" "Uninstall Basic programs" "Uninstall Coding related programs" "Uninstall Rust related programs" "Uninstall Gaming related programs" "Uninstall All Programs" "Exit")

    for i in "${!options[@]}"; do
        echo "$((i+1)). ${options[$i]}"
    done

    # User Input
    echo ""
    read -p "${blue}Enter your choice:${normal}" choice

    # Execute corresponding bash script based on user input
    echo ""
    case $choice in
        1)
            echo "${bold}Updating System${normal}"
            sudo pacman -Syy
            echo "${bold}Done.${normal}"
            ;;
        2)
            echo "${bold}Updating and Upgrading System${normal}"
            sudo pacman -Syyu
            echo "${bold}Done.${normal}"
            ;;
        3) 
            echo "${bold}Creating FS${normal}"
            chmod +x ./auto-fs.sh
            ./auto-fs.sh
            echo "${bold}Done.${normal}"
            ;;
        4)
            echo "${bold}Setup Flatpak Snap and AUR${normal}"
            installSnapAndFlatpakAndAurArch
            echo "${bold}Done.${normal}"
            ;;
        5) 
            echo "${bold}Running Basic Post Install Setup${normal}"
            chmod +x ./auto-fs.sh
            ./auto-fs.sh
            upgradeArch
            installSnapAndFlatpakAndAurArch
            installArchPrograms
            echo "${bold}Done.${normal}"
            ;;
        6) 
            echo "${bold}Uninstall Music Prod Apps${normal}"; 
            uninstallMusicProdArchPrograms
            ;;
        7) 
            echo "${bold}Uninstalling Graphics Programs${normal}"; 
            uninstallGraphicsArchPrograms
            ;;
        8)
            echo "${bold}Uninstall AMD GPU related programs${normal}"; 
            uninstallAmdGpuArchPrograms
            ;;
        9)
            echo "${bold}Uninstall Basic programs${normal}"; 
            uninstallBasicArchPrograms
            ;;
        10)
            echo "${bold}Uninstall Coding related programs${normal}"; 
            uninstallCodingPrograms
            ;;
        11)
            echo "${bold}Uninstall Rust related programs${normal}"; 
            uninstallRustArchProgram
            ;;
        12)
            echo "${bold}Uninstall Gaming related programs${normal}"; 
            uninstallGamingArchPrograms
            ;;
        13)
            echo "${bold}Uninstall All Programs${normal}"; 
            uninstallMusicProdArchPrograms
            uninstallGraphicsArchPrograms
            uninstallAmdGpuArchPrograms
            uninstallBasicArchPrograms
            uninstallCodingPrograms
            uninstallRustArchProgram
            uninstallGamingArchPrograms
            ;;
        14) 
            echo "${bold}Exiting...${normal}"; 
            exit ;;
        *) 
            echo "${bold}Invalid choice. Please enter a number from 1 to 14.${normal}" ;;
    esac
}

archSetup

# extra functions
# function installI3OnArch() {
#     echo "${bold}Installing i3 WM${normal}"
#     sudo pacman -S --needed i3-wm i3lock i3status
# }
# function installXfceOnArch() {
#     echo "${bold}Installing XFCE${normal}"
#     sudo pacman -S --needed xfce4-gtk3 xfce4-goodies xfce4-terminal network-manager-applet xfce4-notifyd-gtk3 xfce4-whiskermenu-plugin-gtk3 tumbler engrampa lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings
#     sudo systemctl enable lightdm.service --force
# }
# function installKdeOnArch() {
#     echo "${bold}Installing KDE Plasma${normal}"
#     sudo pacman -S --needed plasma kio-extras
# }
# function installGnomeOnArch() {
#     echo "${bold}Installing GNOME${normal}"
#     sudo pacman -S --needed gnome gnome-extra
# }