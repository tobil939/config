#!/bin/bash

echo -e "Benutzername: ?"
user_name=$(whoami)
echo -e "\n Benutzername: $user_name \n"

# Installation von yay
echo -e "\n \n \n ------yay------"
cd /home/$user_name
sudo pacman -Sy --needed git base-devel --noconfirm
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd /home/$user_name

# Bitte hier die Progamme angeben die installiert werden sollen
# pacman
progpac=(
  "wayland"
  "hyprland"
  "nm-applet"
  "texlive"
  "texmaker"
  "gnome-calendar"
  "gdbgui"
)

#yay
progyay=(
  "polkit"
  "waybar"
  "hypridle"
  "swaync"
  "wofi"
  "hypridle"
  "hyprlock"
  "hyprshot"
  "pavucontrol"
  "qt5-wayland"
  "qt6-wayland"
  "neofetch"
  "kitty"
  "firefox"
  "gedit"
  "ttf-meslo-nerd"
  "picom"
  "feh"
  "git"
  "github-cli"
  "nautilus"
  "dolphin"
  "timeshift"
  "gtk2"
  "gtk3"
  "gtk4"
  "arc-gtk-theme"
  "gtk-engine-murrine"
  "lxappearance"
  "endeavour"
  "evince"
  "nitrogen"
  "neovim"
  "gcc"
  "gdb"
  "gdb-common"
  "npm"
  "python3"
  "python-gdbgui"
  "pdb"
  "libreoffice-still"
)

# installieren von pacman Programmen
for prog in "${progpac[@]}"; do
  echo -e "\n \n \n"
  echo -e "\n ------------------------------------"
  echo -e "installiere $prog"
  notify-send "$prog wird installiert"

  if [ $? -eq 0 ]; then
    echo -e "$prog wurde erfolgreich installiert"
    notify-send "$prog wurde erfolgreich installiert"
  else
    echo -e "$prog wurde nicht richig installiert"
    notify-send "$prog wurde nicht richtig installiert"
  fi
done

# installieren von pacman Programmen
for prog in "${progyay[@]}"; do
  echo -e "\n \n \n"
  echo -e "\n ------------------------------------"
  echo -e "installiere $prog"
  notify-send "$prog wird installiert"
  sudo yay -Sy --noconfirm "$prog"

  if [ $? -eq 0 ]; then
    echo -e "$prog wurde erfolgreich installiert"
    notify-send "$prog wurde erfolgreich installiert"
  else
    echo -e "$prog wurde nicht richig installiert"
    notify-send "$prog wurde nicht richtig installiert"
  fi
done

echo -e "\n \n \n ------npm------"
echo -e "\n \n \n ------tree-sitter------"
notify-send "tree sitter wird installiert"
sudo npm install -g tree-sitter --silent
sudo npm install -g tree-sitter-cli --silent
sudo npm install -g matlab-language-server --silent

echo -e "\n \n \n ------yay Update------"
notify-send "yay Update"
yay -Syu --devel
yay -Syu --timeupdate

echo -e "\n \n \n ------pacman Update------"
notify-send "pacman Update"
sudo pacman -Syu --noconfirm

echo "Ordner erstellen"
notify-send "Ordner werden erstellt"
cd /home/$user_name/
mkdir -p /home/$user_name/git1/arduino
mkdir -p /home/$user_name/git1/config
mkdir -p /home/$user_name/git1/doku
mkdir -p /home/$user_name/git1/latex_vorlage
mkdir -p /home/$user_name/git/
mkdir -p ~/.config/nvim/lua/config/
mkdir -p ~/.config/nvim/lua/plugins/
mkdir -p ~/.config/hypr/
mkdir -p ~/.config/waybar/
mkdir -p ~/.config/kitty/

echo -e "\n \n \n ------Dateien clonen------"
notify-send "Dateien Werden geclont"
git clone https://github.com/tobil939/doku.git /home/$user_name/git1/doku
git clone https://github.com/tobil939/config.git /home/$user_name/git1/config
git clone https://github.com/tobil939/arduino.git /home/$user_name/git1/arduino
git clone https://github.com/tobil939/latex_vorlage.git /home/$user_name/git1/latex_vorlage
echo -e "\n \n \n ------Daten kopieren------"
# Dateien verschieben und alte löschen
cd /home/$user_name/git1/config/
echo -e "\n \n \n ------init.lua------"
notify-send "init.lua wird kopiert"
if [ -f ~/.config/nvim/init.lua ]; then
  sudo rm ~/.config/nvim/init.lua
fi
sudo cp init.lua ~/.config/nvim/init.lua

echo -e "\n \n \n ------example.lua------"
notify-send "example wird kopiert"
if [ -f ~/.config/nvim/lua/plugins/example.lua ]; then
  sudo rm ~/.config/nvim/lua/plugins/example.lua
fi
sudo cp example.lua ~/.config/nvim/lua/plugins/example.lua

echo -e "\n \n \n ------autocmds.lua------"
notify-send "autocmds wird kopiert"
if [ -f ~/.config/nvim/lua/config/autocmds.lua ]; then
  sudo rm ~/.config/nvim/lua/config/autocmds.lua
fi
sudo cp autocmds.lua ~/.config/nvim/lua/config/autocmds.lua

echo -e "\n \n \n ------keymaps.lua------"
notify-send "keymaps werden kopiert"
if [ -f ~/.config/nvim/lua/config/keymaps.lua ]; then
  sudo rm ~/.config/nvim/lua/config/keymaps.lua
fi
sudo cp keymaps.lua ~/.config/nvim/lua/config/keymaps.lua

echo -e "\n \n \n ------lazy.lua------"
notify-send "lazy werden kopiert"
if [ -f ~/.config/nvim/lua/config/lazy.lua ]; then
  sudo rm ~/.config/nvim/lua/config/lazy.lua
fi
sudo cp lazy.lua ~/.config/nvim/lua/config/lazy.lua

echo -e "\n \n \n ------options.lua------"
notify-send "options werden kopiert"
if [ -f ~/.config/nvim/lua/config/options.lua ]; then
  sudo rm ~/.config/nvim/lua/config/options.lua
fi
sudo cp options.lua ~/.config/nvim/lua/config/options.lua

echo -e "\n \n \n ------hyprland.conf------"
notify-send "hyprland werden kopiert"
if [ -f ~/.config/hypr/hyprland.conf ]; then
  sudo rm ~/.config/hypr/hyprland.conf
fi
sudo cp hyprland.conf ~/.config/hypr/hyprland.conf

echo -e "\n \n \n ------waybar config------"
notify-send "waybar wird kopiert"
if [ -f ~/.config/waybar/config.jsonc ]; then
  sudo rm ~/.config/waybar/config.jsonc
fi
sudo cp config.jsonc ~/.config/waybar/config.jsonc

echo -e "\n \n \n ------waybar style------"
if [ -f ~/.config/waybar/style.css ]; then
  sudo rm ~/.config/waybar/style.css
fi
sudo cp config.jsonc ~/.config/waybar/style.css

echo -e "\n \n \n ------kitty conf------"
notify-send "kitty wird kopiert"
if [ -f ~/.config/kitty/kitty.conf ]; then
  sudo rm ~/.config/kitty/kitty.conf
fi
sudo cp kitty.conf ~/.config/kitty/kitty.conf

echo -e "\n \n \n ------bash------"
notify-send "bash wird erstellt für LaTeX"
if [ -f /usr/local/bin/tex.sh ]; then
  sudo rm /usr/local/bin/tex.sh
fi
cd /home/$user_name/git1/latex_vorlage
sudo cp tex.sh /usr/local/bin/tex.sh
cd /usr/local/bin/
sudo chmod +x tex.sh
cd /home/$user_name/

echo -e "\n \n \n ------Update------"
sudo pacman -Syu --noconfirm

echo -e "\n \n \n ------Dark Mode------"

gsettings set org.gnome.desktop.interface gtk-theme "Arc-Dark"
gsettings set org.gnome.desktop.interface icon-theme "Adwaita"
gsettings set org.gnome.shell.extensions.user-theme name "Adwaita"
gsettings set org.gnome.desktop.interface color-scheme prefer-dark

echo -e "\n \n \n ------neofetch einbinden------"
if ! grep -Fxq "neofetch" ~/.bashrc; then
  echo "neofetch" >>~/.bashrc
  echo "neofetch hinzugefügt"
else
  echo "neofetch bereits vorhanden"
fi

echo -e "\n \n \n ------git config------"
echo -e "Benutzername: ?"
user_name=$(whoami)
echo -e "\n Benutzername: $user_name \n"
read -p "Benutzername für git: " user_git
echo -e "\n Benutzername für git: $user_git \n"
read -p "Emailadresse für git: " user_email
echo -e "\n Emailadresse für git: $user_email \n"
git config --global user.name "$user_git"
git config --global user.email "$user_email"
git config --global core.editor nvim
git config --list

echo -e "\n \n \n ------fertig------"
#reboot
