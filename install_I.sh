#!/bin/bash

echo -e "Benutzername: ?"
user_name=$(whoami)
echo -e "\n Benutzername: $user_name \n"
read -p "Benutzername für git: " user_git
echo -e "\n Benutzername für git: $user_git \n"
read -p "Emailadresse für git: " user_email
echo -e "\n Emailadresse für git: $user_email \n"

# Installation von verschiedenen Paketen
echo -e "\n \n \n neofetch"
sudo pacman -S neofetch --noconfirm
echo -e "\n \n \n i3wm"
sudo pacman -S i3-wm --noconfirm
echo -e "\n kitty"
sudo pacman -S kitty --noconfirm
echo -e "\n dmenu"
sudo pacman -S dmenu --noconfirm
echo -e "\n firefox"
sudo pacman -S firefox --noconfirm
echo -e "\n gedit"
sudo pacman -S gedit --noconfirm
echo -e "\n ttf-meslo-nerd"
sudo pacman -S ttf-meslo-nerd --noconfirm
echo -e "\n picom"
sudo pacman -S picom --noconfirm
echo -e "\n feh"
sudo pacman -S feh --noconfirm
echo -e "\n git"
sudo pacman -S git --noconfirm
echo -e "\n \n \n git cli"
sudo pacman -S github-cli --noconfirm
echo -e "\n \n \n wayland"
sudo pacman -S wayland --noconfirm
echo -e "\n \n \n nautilus"
sudo pacman -S nautilus --noconfirm
echo -e "\n timeshift"
sudo pacman -S timeshift --noconfirm
echo -e "\n xorg"
sudo pacman -S xorg --noconfirm
echo -e "\n gtk"
sudo pacman -S gtk2 --noconfirm
sudo pacman -S gtk3 --noconfirm
sudo pacman -S gtk4 --noconfirm
sudo pacman -S gtk-engine-murrine --noconfirm
echo -e "\n Dark Theme"
sudo pacman -S gnome-themes-extra --noconfirm
sudo pacman -S arc-gtk-theme --noconfirm
echo -e "\n lxappearance"
sudo pacman -S lxappearance --noconfirm
echo -e "\n npm"
sudo pacman -S npm --noconfirm
echo -e "\n todo list"
sudo pacman -S endeavour --noconfirm
echo -e "\n PDF"
sudo pacman -S evince --noconfirm
echo -e "\n LaTeX"
sudo pacman -S texlive --noconfirm
sudo pacman -S texmaker --noconfirm
echo -e "\n Nitrogen"
sudo pacman -S nitrogen --noconfirm
echo -e "\n Kalender"
sudo pacman -S gnome-calendar --noconfirm
echo -e "\n \n \n i3status"
sudo pacman -S i3status --noconfirm
echo -e "\n Nvim"
sudo pacman -S neovim --noconfirm
echo -e "\n \n \n tree-sitter"
sudo npm install -g tree-sitter
sudo npm install -g tree-sitter-cli

# Update durchführen
echo -e "\n \n \n Update"
sudo pacman -Syu --noconfirm

# Git-Konfiguration
echo -e "\n \n \n git config"
git config --global user.name "$user_git"
git config --global user.email "$user_email"
git config --global core.editor nvim
git config --list

# Installation von yay
echo -e "\n \n \n yay"
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay 
makepkg -si
cd ~

echo -e "\n \n \n yay Update"
yay -Syu --devel
yay -Syu --timeupdate

#reboot


