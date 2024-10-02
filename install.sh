#!/bin/bash

# Installation von verschiedenen Paketen
echo -e "\n neofetch"
sudo pacman -S neofetch --noconfirm
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
echo -e "\n timeshift"
sudo pacman -S timeshift --noconfirm
echo -e "\n xorg"
sudo pacman -S xorg --noconfirm
echo -e "\n gtk"
sudo pacman -S gtk2 --noconfirm
sudo pacman -S gtk3 --noconfirm
sudo pacman -S gtk4 --noconfirm
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
echo -e "\n Nvim"
sudo pacman -S neovim --noconfirm

# Update durchführen
echo -e "\n \n \n Update"
sudo pacman -Syu --noconfirm

# Git-Konfiguration
echo -e "\n \n \n git config"
git config --global user.name "tobil939"
git config --global user.email "tobias.leitz@gmx.de"
git config --global core.editor nvim
git config --list

# Git-Ordner erstellen und klonen
echo -e "\n \n \n git kopieren"
echo "Ordner erstellen"
mkdir -p /home/tobil/git1/arduino
mkdir -p /home/tobil/git1/config
mkdir -p /home/tobil/git1/doku
mkdir -p /home/tobil/git1/latex_vorlage

echo -e "\n \n \n Dateien clonen"
git clone https://github.com/tobil939/doku.git /home/tobil/git1/doku
git clone https://github.com/tobil939/config.git /home/tobil/git1/config
git clone https://github.com/tobil939/arduino.git /home/tobil/git1/arduino
git clone https://github.com/tobil939/latex_vorlage.git /home/tobil/git1/latex_vorlage

# Dateien und Verzeichnisse verschieben
echo -e "\n \n \n Dateien verschieben"
cd /home/tobil/git1/config/

# Verzeichnisse für nvim und i3 erstellen, falls nicht vorhanden
mkdir -p ~/.config/nvim/lua/config/
mkdir -p ~/.config/nvim/lua/plugins/
mkdir -p ~/.config/i3/
mkdir -p ~/.config/gtk-3.0/
mkdir -p ~/.config/gtk-4.0/

# Dateien verschieben und alte löschen
if [ -f ~/.config/nvim/init.lua ]; then
  sudo rm ~/.config/nvim/init.lua
fi
sudo cp init.lua ~/.config/nvim/init.lua

if [ -f ~/.config/nvim/lua/plugins/example.lua ]; then
  sudo rm ~/.config/nvim/lua/plugins/example.lua
fi
sudo cp example.lua ~/.config/nvim/lua/plugins/example.lua

if [ -f ~/.config/nvim/lua/config/autocmds.lua ]; then
  sudo rm ~/.config/nvim/lua/config/autocmds.lua
fi
sudo cp autocmds.lua ~/.config/nvim/lua/config/autocmds.lua

if [ -f ~/.config/nvim/lua/config/keymaps.lua ]; then
  sudo rm ~/.config/nvim/lua/config/keymaps.lua
fi
sudo cp keymaps.lua ~/.config/nvim/lua/config/keymaps.lua

if [ -f ~/.config/nvim/lua/config/lazy.lua ]; then
  sudo rm ~/.config/nvim/lua/config/lazy.lua
fi
sudo cp lazy.lua ~/.config/nvim/lua/config/lazy.lua

if [ -f ~/.config/nvim/lua/config/options.lua ]; then
  sudo rm ~/.config/nvim/lua/config/options.lua
fi
sudo cp options.lua ~/.config/nvim/lua/config/options.lua

if [ -f ~/.config/i3/config ]; then
  sudo rm ~/.config/i3/config
fi
sudo cp config_i3 ~/.config/i3/config

if [ -f ~/.config/i3/.i3status.conf ]; then
  sudo rm ~/.config/i3/.i3status.conf
fi
sudo cp i3status.conf ~/.config/i3/.i3status.conf

if [ -f ~/.config/gtk-3.0/settings.ini ]; then
  sudo rm ~/.config/gtk-3.0/settings.ini
fi
sudo cp settings_gtk3.ini ~/.config/gtk-3.0/settings.ini

if [ -f ~/.config/gtk-4.0/settings.ini ]; then
  sudo rm ~/.config/gtk-4.0/settings.ini
fi
sudo cp settings_gtk4.ini ~/.config/gtk-4.0/settings.ini

