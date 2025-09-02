#!/bin/sh

urls=$(curl -sL https://api.github.com/repos/koeqaife/hyprland-material-you/releases/latest | jq -r '.assets[].browser_download_url')
filenames=$(curl -sL https://api.github.com/repos/koeqaife/hyprland-material-you/releases/latest | jq -r '.assets[].name')

clear
echo " _   _                __   __          "
echo "| | | |_   _ _ __  _ _\ \ / /__  _   _ "
echo "| |_| | | | | '_ \| '__\ V / _ \| | | |"
echo "|  _  | |_| | |_) | |   | | (_) | |_| |"
echo "|_| |_|__,  | .__/|_|   |_|\___/ \_,_/"
echo "       |___/|_|                        " 
echo ""
echo " This is the installer of the HyprYou"
echo "   Hyprland's Rice made by Koeqaife"
echo ""
echo "    To change page, press any key!"
echo ""
echo "                             page 1/4"
read -n 1
clear
echo " _   _                __   __          "
echo "| | | |_   _ _ __  _ _\ \ / /__  _   _ "
echo "| |_| | | | | '_ \| '__\ V / _ \| | | |"
echo "|  _  | |_| | |_) | |   | | (_) | |_| |"
echo "|_| |_|__,  | .__/|_|   |_|\___/ \_,_/"
echo "       |___/|_|                        " 
echo ""
echo "   When you use this DE, you should"
echo "      change session to HyprYou."
echo ""
echo "                             page 2/4"
read -n 1
clear
echo " _   _                __   __          "
echo "| | | |_   _ _ __  _ _\ \ / /__  _   _ "
echo "| |_| | | | | '_ \| '__\ V / _ \| | | |"
echo "|  _  | |_| | |_) | |   | | (_) | |_| |"
echo "|_| |_|__,  | .__/|_|   |_|\___/ \_,_/"
echo "       |___/|_|                        " 
echo ""
echo "                             page 3/4"

sudo pacman -S --noconfirm git base-devel wget jq alacritty nautilus
mkdir -p ~/.cache/hypryou-installer
cd ~/.cache/hypryou-installer

for url in $urls; do
  filename=$(basename "$url")
  wget -q --show-progress -O "$filename" "$url"
done

git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin && makepkg -si --noconfirm

yay -S --noconfirm python-materialyoucolor-git libastal-bluetooth-git ttf-material-symbols-variable-git libastal-wireplumber-git

cd ~/.cache/hypryou-installer

sudo pacman -U --noconfirm hypryou*

sudo systemctl enable greetd.service

rm -rf ~/.cache/hypryou-installer

clear

echo " _   _                __   __          "
echo "| | | |_   _ _ __  _ _\ \ / /__  _   _ "
echo "| |_| | | | | '_ \| '__\ V / _ \| | | |"
echo "|  _  | |_| | |_) | |   | | (_) | |_| |"
echo "|_| |_|__,  | .__/|_|   |_|\___/ \_,_/"
echo "       |___/|_|                        " 
echo ""
echo " Installation finished. Please reboot"
