#!/bin/bash

# Installation von verschiedenen Paketen
echo -e "\n \n \ \n neofetch"
sudo pacman -S neofetch --noconfirm
echo -e "\n \n \n kitty"
sudo pacman -S kitty --noconfirm
echo -e "\n \n \n dmenu"
sudo pacman -S dmenu --noconfirm
echo -e "\n \n \n firefox"
sudo pacman -S firefox --noconfirm
echo -e "\n \n \n gedit"
sudo pacman -S gedit --noconfirm
echo -e "\n \n \n nttf-meslo-nerd"
sudo pacman -S ttf-meslo-nerd --noconfirm
echo -e "\n \n \n picom"
sudo pacman -S picom --noconfirm
echo -e "\n \n \n feh"
sudo pacman -S feh --noconfirm
echo -e "\n \n \n git"
sudo pacman -S git --noconfirm
echo -e "\n \n \n timeshift"
sudo pacman -S timeshift --noconfirm
echo -e "\n \n \n xorg"
sudo pacman -S xorg --noconfirm
echo -e "\n \n \n gtk"
sudo pacman -S gtk2 --noconfirm
sudo pacman -S gtk3 --noconfirm
sudo pacman -S gtk4 --noconfirm
echo -e "\n \n \n Dark Theme"
sudo pacman -S gnome-themes-extra --noconfirm
sudo pacman -S arc-gtk-theme --noconfirm
echo -e "\n \n \n lxappearance"
sudo pacman -S lxappearance --noconfirm
echo -e "\n \n \n npm"
sudo pacman -S npm --noconfirm
echo -e "\n \n \n todo list"
sudo pacman -S endeavour --noconfirm
echo -e "\n \n \n PDF"
sudo pacman -S evince --noconfirm
echo -e "\n \n \n LaTeX"
sudo pacman -S texlive --noconfirm
sudo pacman -S texmaker --noconfirm
echo -e "\n \n \n Nitrogen"
sudo pacman -S nitrogen --noconfirm
echo -e "\n \n \n Kalender"
sudo pacman -S gnome-calendar --noconfirm
echo -e "\n \n \n Nvim"
sudo pacman -S neovim --noconfirm
echo -e "\n \n \n Email"
sudo pacman -S gnome-extra --noconfirm
echo -e "\n \n \n yay"
sudo pacman -S -needed base-devel git
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
yay -version
cd ..

echo -e "\n \n \n git config"
git config --global user.name "tobil939"
git config --global user.email "tobias.leitz@gmx.de"
git config --global core.editor nvim
git config --list

echo -e "\n \n \n git kopieren"
echo "Ordner erstellen"
mkdir /home/tobil/git1/arduino
mkdir /home/tobil/git1/config
mkdir /home/tobil/git1/doku
mkdir /home/tobil/git1/latex_vorlage

echo -e "\n \n \n Dateien clonen"
git clone https://github.com/tobil939/doku.git /home/tobil/git1/doku/
git clone https://github.com/tobil939/config.git /home/tobil/git1/config
git clone htpps://github.com/tobil939/arduino.git /home/tobil/git1/arduino
git clone https://github.com/tobil939/latex_vorlage /home/tobil/git1/latex_vorlage
