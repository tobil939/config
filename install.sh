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
git clone kttps://aur.archlinux.org/yay.git
cd yay 
makepkg -si
cd ~

echo -e "\n \n \n yay Update
yay -Syu --devel
yay -Syu --timeupdate

# Git-Ordner erstellen und klonen
echo -e "\n \n \n git kopieren"
echo "Ordner erstellen"
mkdir -p /home/$user_name/git1/arduino
mkdir -p /home/$user_name/git1/config
mkdir -p /home/$user_name/git1/doku
mkdir -p /home/$user_name/git1/latex_vorlage
mkdir -p /home/$user_name/git/

echo -e "\n \n \n Dateien clonen"
git clone https://github.com/tobil939/doku.git /home/$user_name/git1/doku
git clone https://github.com/tobil939/config.git /home/$user_name/git1/config
git clone https://github.com/tobil939/arduino.git /home/$user_name/git1/arduino
git clone https://github.com/tobil939/latex_vorlage.git /home/$user_name/git1/latex_vorlage

# Dateien und Verzeichnisse verschieben
echo -e "\n \n \n Dateien verschieben"
cd /home/$user_name/git1/config/

# Verzeichnisse für nvim und i3 erstellen, falls nicht vorhanden
echo -e "\n \n \n Ordner werden erstellt"
mkdir -p ~/.config/nvim/lua/config/
mkdir -p ~/.config/nvim/lua/plugins/
mkdir -p ~/.config/i3/
mkdir -p ~/.config/gtk-3.0/
mkdir -p ~/.config/gtk-4.0/
mkdir -p ~/.config/kitty/

# Dateien verschieben und alte löschen
cd /home/$user_name/git1/config/
echo -e "\n \n \n init.lua"
if [ -f ~/.config/nvim/init.lua ]; then
  sudo rm ~/.config/nvim/init.lua
fi
sudo cp init.lua ~/.config/nvim/init.lua

echo -e "\n \n \n example.lua"
if [ -f ~/.config/nvim/lua/plugins/example.lua ]; then
  sudo rm ~/.config/nvim/lua/plugins/example.lua
fi
sudo cp example.lua ~/.config/nvim/lua/plugins/example.lua

echo -e "\n \n \n autocmds.lua"
if [ -f ~/.config/nvim/lua/config/autocmds.lua ]; then
  sudo rm ~/.config/nvim/lua/config/autocmds.lua
fi
sudo cp autocmds.lua ~/.config/nvim/lua/config/autocmds.lua

echo -e "\n \n \n keymaps.lua"
if [ -f ~/.config/nvim/lua/config/keymaps.lua ]; then
  sudo rm ~/.config/nvim/lua/config/keymaps.lua
fi
sudo cp keymaps.lua ~/.config/nvim/lua/config/keymaps.lua

echo -e "\n \n \n lazy.lua"
if [ -f ~/.config/nvim/lua/config/lazy.lua ]; then
  sudo rm ~/.config/nvim/lua/config/lazy.lua
fi
sudo cp lazy.lua ~/.config/nvim/lua/config/lazy.lua

echo -e "\n \n \n options.lua"
if [ -f ~/.config/nvim/lua/config/options.lua ]; then
  sudo rm ~/.config/nvim/lua/config/options.lua
fi
sudo cp options.lua ~/.config/nvim/lua/config/options.lua

echo -e "\n \n \n i3 config"
if [ -f ~/.config/i3/config ]; then
  sudo rm ~/.config/i3/config
fi
sudo cp config_i3 ~/.config/i3/config

echo -e "\n \n \n i3status"
if [ -f ~/.config/i3/.i3status.conf ]; then
  sudo rm ~/.config/i3/.i3status.conf
fi
sudo cp i3status.conf ~/.config/i3/.i3status.conf

echo -e "\n \n \n gtk3 settings"
if [ -f ~/.config/gtk-3.0/settings.ini ]; then
  sudo rm ~/.config/gtk-3.0/settings.ini
fi
sudo cp settings_gtk3.ini ~/.config/gtk-3.0/settings.ini

echo -e "\n \n \n gtk4 settings"
if [ -f ~/.config/gtk-4.0/settings.ini ]; then
  sudo rm ~/.config/gtk-4.0/settings.ini
fi
sudo cp settings_gtk4.ini ~/.config/gtk-4.0/settings.ini

echo -e "\n \n \n kitty conf"
if [ -f ~/.config/kitty/kitty.conf ]; then
  sudo rm ~/.config/kitty/kitty.conf
fi
sudo cp kitty.conf ~/.config/kitty/kitty.conf

echo -e "\n \n \n bash"
if [ -f /usr/local/bin/tex.sh ]; then
  sudo rm /usr/local/bin/tex.sh
fi

cd /home/$user_name/git1/latex_vorlage
sudo cp tex.sh /usr/local/tex.sh
chmod +x tex.sh
cd ~

echo -e "\n \n \n Update"
sudo pacman -Syu --noconfirm

echo -e "\n \n \n Dark Mode"
gsettings set org.gnome.desktop.interface gtk-theme "Arc-Dark"
gsettings set org.gnome.desktop.interface icon-theme "Adwaita"
gsettings set org.gnome.shell.extensions.user-theme name "Adwaita"

echo -e "\n \n \n neofetch einbinden"
if [ ! greq -Fxq "neofetch" ~/.bashrc}; then
  echo "neofetch" >> ~/.bashrc
  echo "neofetch hinzugefügt"
else
  echo "neofetch bereits vorhanden"
fi

echo -e "\n \n \n fertig"
