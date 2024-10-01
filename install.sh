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
#sudo pacman -S gnome-extra --noconfirm
#echo -e "\n \n \n yay"
#sudo pacman -S -needed base-devel git --noconfirm
#git clone https://aur.archlinux.org/yay-bin.git
#cd yay-bin
#makepkg -si
#yay -version

echo -e "\n \n \n Update"
sudo pacman -Syu -noconfirm

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
git clone https://github.com/tobil939/doku.git /home/tobil/git1/doku
git clone https://github.com/tobil939/config.git /home/tobil/git1/config
git clone https://github.com/tobil939/arduino.git /home/tobil/git1/arduino
git clone https://github.com/tobil939/latex_vorlage /home/tobil/git1/latex_vorlage

echo -e "\n \n \n Dateien verschieben"
cd /home/tobil/git1/config/
mkdir ~/.config/nvim/
mkdir ~/.config/nvim/lua/
mkdir ~/.config/nvim/lua/config/
mkdir ~/.config/nvim/lua/plugins/
mkdir ~/.config/i3/
mkdir ~/.config/gtk-3.0/
mkdir ~/.config/gtk-4.0/
cp init.lua ~/.config/nvim/init.lua
cp example.lua ~/.config/nvim/lua/plugins/example.lua
cp autocmds.lua ~/.config/nvim/lua/config/autocmds.lua
cp keymaps.lua ~/.config/nvim/lua/config/keymaps.lua
cp lazy.lua ~/.config/nvim/lua/config/lazy.lua
cp options.lua ~/.config/nvim/lua/config/options.lua
cp config_i3 ~/.config/i3/config
cp i3status.conf ~/.config/i3/.i3status.conf
cp settings_gtk3.ini ~/.config/gtk-3.0/settings.ini
cp settings_gtk4.ini ~/.config/gtk-4.0/settings.ini
