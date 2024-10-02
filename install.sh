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
if [ ! -d "~/.config/nvim/"]; then
  mkdir ~/.config/nvim/
fi

if [ ! -d "~/.config/nvim/lua/"]; then
  mkdir ~/.config/nvim/lua/
fi

if [ ! -d "~/.config/nvim/lua/config/"]; then
  mkdir ~/.config/nvim/lua/config/
fi

if [ ! -d "~/.config/nvim/lua/plugins/"]; then
  mkdir ~/.config/nvim/lua/plugins/
fi

if [ ! -d "~/.config/i3/"]; then
  mkdir ~/.config/i3/
fi

if [ ! -d "~/.config/gtk-3.0/"]; then
  mkdir ~/.config/gtk-3.0/
fi

if [ ! -d "~/.config/gtk-4.0/"]; then
  mkdir ~/.config/gtk-4.0/
fi

if [ -d "~/.config/nvim/init.lua"]; then
  rm ~/.config/nvim/init.lua
fi
cp init.lua ~/.config/nvim/init.lua

if [ -d "~/.config/nvim/lua/plugins/example.lua/"]; then
  rm ~/.config/nvim/lua/plugins/example.lua 
fi
cp example.lua ~/.config/nvim/lua/plugins/example.lua

if [ -d "~/.config/nvim/lua/config/autocmds.lua"]; then
  rm ~/.config/nvim/lua/config/autocmds.lua
fi
cp autocmds.lua ~/.config/nvim/lua/config/autocmds.lua

if [ -d "~/.config/nvim/lua/config/keymaps.lua"]; then
  rm ~/.config/nvim/lua/config/keymaps.lua
fi
cp keymaps.lua ~/.config/nvim/lua/config/keymaps.lua

if [ -d "~/.config/nvim/lua/config/lazy.lua"]; then
  rm ~/.config/nvim/lua/config/lazy.lua
fi
cp lazy.lua ~/.config/nvim/lua/config/lazy.lua

if [ -d "~/.config/nvim/nvim/lua/config/options.lua"]; then
  rm ~/.config/nvim/lua/config/options.lua
fi
cp options.lua ~/.config/nvim/lua/config/options.lua

if [ -d "~/.config/i3/config"]; then
  rm ~/.config/i3/config
fi
cp config_i3 ~/.config/i3/config

if [ -d "~/.config/i3/.i3status.conf"]; then
  rm ~/.config/i3/.i3status.conf
fi
cp i3status.conf ~/.config/i3/.i3status.conf

if [ -d "~/.config/gtk-3.0/settings.ini"]; then
  rm ~/.config/gtk-3.0/settings.ini
fi
cp settings_gtk3.ini ~/.config/gtk-3.0/settings.ini

if [ -d "~/.config/gtk-4.0/settings.ini"]; then
  rm ~/.config/gtk-4.0/settings.ini
fi
cp settings_gtk4.ini ~/.config/gtk-4.0/settings.ini





