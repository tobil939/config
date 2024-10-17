#!/bin/bash

echo -e "Benutzername: ?"
user_name=$(whoami)
echo -e "\n Benutzername: $user_name \n"
#read -p "Benutzername für git: " user_git
#echo -e "\n Benutzername für git: $user_git \n"
#read -p "Emailadresse für git: " user_email
#echo -e "\n Emailadresse für git: $user_email \n"

# Installation von verschiedenen Paketen
echo -e "\n \n \n ------wayland------"
sudo pacman -Sy wayland --noconfirm
echo -e "\n \n \n ------hyprland------"
sudo pacman -Sy hyprland --noconfirm
echo -e "\n \n \n ------nm-applet------"
sudo pacman -Sy nm-applet --noconfirm
echo -e "\n \n \n ------waybar------"
sudo pacman -Sy waybar --noconfirm
echo -e "\n \n \n ------swaync------"
sudo pacman -Sy swaync --noconfirm
echo -e "\n \n \n ------wofi------"
sudo pacman -Sy wofi --noconfirm
echo -e "\n \n \n ------hypridle------"
sudo pacman -Sy hypridle --noconfirm
echo -e "\n \n \ņ ------hyprlock------"
sudo pacman -Sy hyprlock --noconfirm
echo -e "\n \n \n ------hyprshot------"
sudo pacman -Sy hyprshot --noconfirm
echo -e "\n \n \n ------pavucontrol------"
sudo pacman -Sy pavucontrol --noconfirm
echo -e "\n \n \n ------qt5-wayland------"
sudo pacman -Sy qt5-wayland --noconfirm
echo -e "\n \n \n ------qt6-wayland------"
sudo pacman -Sy qt6-wayland --noconfirm
echo -e "\n \n \n ------polkit------"
sudo pacman -Sy polkit --noconfirm
echo -e "\n \n \n ------neofetch------"
sudo pacman -Sy neofetch --noconfirm
echo -e "\n \n \n ------kitty------"
sudo pacman -Sy kitty --noconfirm
echo -e "\n \n \n ------firefox------"
sudo pacman -Sy firefox --noconfirm
echo -e "\n \n \n ------gedit------"
sudo pacman -Sy gedit --noconfirm
echo -e "\n \n \n ------ttf-meslo-nerd------"
sudo pacman -Sy ttf-meslo-nerd --noconfirm
echo -e "\n \n \n ------picom------"
sudo pacman -Sy picom --noconfirm
echo -e "\n \n \n ------feh------"
sudo pacman -Sy feh --noconfirm
echo -e "\n \n \n ------git------"
sudo pacman -Sy git --noconfirm
echo -e "\n \n \n ------git cli------"
sudo pacman -Sy github-cli --noconfirm
echo -e "\n \n \n ------nautilus------"
sudo pacman -Sy nautilus --noconfirm
echo -e "\n \n \n ------timeshift------"
sudo pacman -Sy timeshift --noconfirm
echo -e "\n \n \n ------gtk------"
sudo pacman -Sy gtk2 --noconfirm
sudo pacman -Sy gtk3 --noconfirm
sudo pacman -Sy gtk4 --noconfirm
sudo pacman -Sy gtk-engine-murrine --noconfirm
echo -e "\n \n \n ------Dark Theme------"
sudo pacman -Sy gnome-themes-extra --noconfirm
sudo pacman -Sy arc-gtk-theme --noconfirm
echo -e "\n \n \n ------lxappearance------"
sudo pacman -Sy lxappearance --noconfirm
echo -e "\n \n \n ------todo list------"
sudo pacman -Sy endeavour --noconfirm
echo -e "\n \n \n ------PDF------"
sudo pacman -Sy evince --noconfirm
#echo -e "\n \n \n ------LaTeX------"
#sudo pacman -Sy texlive --noconfirm
#sudo pacman -Sy texmaker --noconfirm
echo -e "\n \n \n ------Nitrogen------"
sudo pacman -Sy nitrogen --noconfirm
echo -e "\n \n \n ------Kalender------"
sudo pacman -Sy gnome-calendar --noconfirm
echo -e "\n \n \n ------Nvim------"
sudo pacman -Sy neovim --noconfirm
echo -e "\n \n \n ------C Umgebung------"
sudo pacman -Sy gcc --noconfirm
sudo pacman -Sy gdb --noconfirm
sudo pacman -Sy gdb-common --noconfirm
sudo pacman -Sy gdbgui --noconfirm

# Update durchführen
echo -e "\n \n \n ------Update------"
sudo pacman -Syu --noconfirm


echo -e "\n \n \n ------npm------"
sudo pacman -Sy npm --noconfirm
echo -e "\n \n \n ------tree-sitter------"
sudo npm install -g tree-sitter
sudo npm install -g tree-sitter-cli
sudo npm install -g matlab-language-server 

# Git-Konfiguration
#echo -e "\n \n \n ------git config------"
#git config --global user.name "$user_git"
#git config --global user.email "$user_email"
#git config --global core.editor nvim
#git config --list

# Installation von yay
echo -e "\n \n \n ------yay------"
cd /home/$user_name
sudo pacman -Sy --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd /home/$user_name

echo -e "\n \n \n ------python Umgebung------"
yay -Sy python3
yay -Sy python-gdbgui
yay -Sy pdb

echo -e "\n \n \n ------libre office------"
yay -Sy libreoffice-still

echo -e "\n \n \n ------yay Update------"
yay -Syu --devel
yay -Syu --timeupdate

#reboot
