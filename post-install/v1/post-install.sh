!/bin/bash

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
                    sudo yay -Syu; 
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
                    sudo pacman -S --noconfirm vlc firefox alacritty qbittorrent kdeconnect brave-browser code p7zip audacious elisa filelight vim neovim neovim-qt gvim htop libreoffice-fresh lshw okular telegram-desktop rxvt-unicode;
                    flatpak install flathub org.onlyoffice.desktopeditors
                    flatpak install flathub md.obsidian.Obsidian
                    flatpak install flathub com.google.Chrome
                    break;;
            [Nn]* ) break;;
            [Ee]* ) exit;;
            * ) echo "Please answer y or n or e.";;
        esac
    done
}

function installI3OnArch() {
    showPlusPattern; 
    printf "                               INSTALL\n"; 
    showPlusPattern; 
    installSnapAndFlatpakArch
    while true; do
        read -p "Do you want to install i3 WM[yne]? " yne 
        case $yne in
            [Yy]* ) printf ">          RUNNING : sudo pacman -S          <\n";
                    sudo pacman -S i3 xorg xorg-xdm dmenu i3status i3lock ttf-dejavu
                    break;;
            [Nn]* ) break;;
            [Ee]* ) exit;;
            * ) echo "Please answer y or n or e.";;
        esac
    done
}

function installArchExCodingPrograms() {
    showPlusPattern; 
    printf "                               INSTALL\n"; 
    showPlusPattern; 
    while true; do
        read -p "Do you want to install extra coding programs[yne]? " yne 
        case $yne in
            [Yy]* ) printf ">          RUNNING : sudo pacman -S          <\n"; 
                    sudo pacman -S --noconfirm netbeans pycharm-community-edition intellij-idea-community-edition codeblocks dbeaver godot kate mysql-workbench;
                    yay -S android-studio;
                    break;;
            [Nn]* ) break;;
            [Ee]* ) exit;;
            * ) echo "Please answer y or n or e.";;
        esac
    done
}

function installArchExMediaPrograms() {
    showPlusPattern; 
    printf "                               INSTALL\n"; 
    showPlusPattern; 
    while true; do
        read -p "Do you want to install extra media programs[yne]? " yne 
        case $yne in
            [Yy]* ) printf ">          RUNNING : sudo pacman -S          <\n"; 
                    sudo pacman -S --noconfirm krita inkscape blender gimp kdenlive;
                    yay -S deadbeef;
                    break;;
            [Nn]* ) break;;
            [Ee]* ) exit;;
            * ) echo "Please answer y or n or e.";;
        esac
    done
}

function installArchMusicProdPrograms() {
    showPlusPattern; 
    printf "                               INSTALL\n"; 
    showPlusPattern; 
    while true; do
        read -p "Do you want to install music production programs[yne]? " yne 
        case $yne in
            [Yy]* ) printf ">          RUNNING : sudo pacman -S          <\n"; 
                    sudo pacman -S --noconfirm ardour audacity lmms helm rosegarden surge stochas;
                    yay -S vital-synth reaper tracktion-waveform;
                    break;;
            [Nn]* ) break;;
            [Ee]* ) exit;;
            * ) echo "Please answer y or n or e.";;
        esac
    done
}

function installArchGamingPrograms() {
    showPlusPattern; 
    printf "                               INSTALL\n"; 
    showPlusPattern; 
    while true; do
        read -p "Do you want to install gaming programs[yne]? " yne 
        case $yne in
            [Yy]* ) printf ">          RUNNING : sudo pacman -S          <\n"; 
                    sudo pacman -S --noconfirm dolphin-emu pcsx2 libretro-pcsx2 retroarch;
                    # yay -S ;
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
                    sudo add-apt-repository ppa:aslatter/ppa
                    sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
                    curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
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
                    sudo apt -y install vlc firefox alacritty qbittorrent kdeconnect brave-browser code p7zip-full audacious elisa filelight vim neovim neovim-qt vim-gtk htop libreoffice lshw okular telegram-desktop rxvt-unicode;
                    flatpak install flathub org.onlyoffice.desktopeditors
                    flatpak install flathub md.obsidian.Obsidian
                    flatpak install flathub com.google.Chrome
                    break;;
            [Nn]* ) break;;
            [Ee]* ) exit;;
            * ) echo "Please answer y or n or e.";;
        esac
    done
}

function installI3OnDebian() {
    showPlusPattern; 
    printf "                               INSTALL\n"; 
    showPlusPattern; 
    while true; do
        read -p "Do you want to install programs[yne]? " yne 
        case $yne in
            [Yy]* ) printf ">          RUNNING : sudo pacman -S          <\n";
                    sudo apt install i3 xorg xorg dmenu i3status i3lock ttf-dejavu suckless-tools lightdm 
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
    installI3OnArch
    installArchExCodingPrograms
    installArchExMediaPrograms
    installArchMusicProdPrograms
    installArchGamingPrograms
elif [ "${distro,,}" == "ubuntu" ];
then
    showBrickPattern
    printf "                     DEBIAN BASED SYSTEM\n"
    showBrickPattern
    updateDebian
    upgradeDebian
    installSnapAndFlatpakDebian
    installDebianPrograms
    installI3OnDebian
fi
