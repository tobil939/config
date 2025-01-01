#!/bin/bash

echo -e "Benutzername: ?"
user_name=$(whoami)
LOG_FILE="/home/$user_name/install.log"
ERROR_LOG_FILE="/home/$user_name/errorinstall.log"
datef="$(date '+%Y-%m-%d %H:%M:%S')"
echo -e "\n $datef Benutzername: $user_name \n" >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"

# Bitte hier die Progamme angeben die installiert werden sollen
# pacman
progpac=(
	"wayland"
	"hyprland"
	"network-manager-applet"
	"texlive"
	"texmaker"
	"gnome-calendar"
	"python3"
	"python-numba"
	"python-dask"
	"python-pandas"
	"python-numpy"
	"python-openpyxl"
	"python-black"
	"stylua"
	"shfmt"
	"clang"
	"texlive-basic"
	"texlive-lang"
	"tree-sitter"
	"fzf"
)

#yay
progyay=(
	"polkit"
	"waybar"
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
	"libreoffice-still"
	"bluez"
	"bluez-utils"
	"blueman"
	"python-gdbgui"
	"pdb"
	"gdbgui"
	"evolution"
	"matlab"
)

# installieren von pacman Programmen
for prog in "${progpac[@]}"; do
	echo -e "\n \n \n"
	echo -e "\n ------------------------------------"
	echo -e "installiere $prog"
	notify-send "$prog wird installiert"
	sudo pacman -Sy --noconfirm "$prog" >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"

	if [ $? -eq 0 ]; then
		echo -e "$prog wurde erfolgreich installiert"
		notify-send "$prog wurde erfolgreich installiert"
	else
		echo -e "$prog wurde nicht richig installiert"
		notify-send "$prog wurde nicht richtig installiert"
	fi
done

# Installation von yay
echo -e "\n \n \n ------yay------"
cd /home/$user_name
sudo pacman -Sy --needed git base-devel --noconfirm >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"
git clone https://aur.archlinux.org/yay.git
cd yay >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"
makepkg -si --noconfirm
cd /home/$user_name >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"

# installieren von yay Programmen
for prog in "${progyay[@]}"; do
	echo -e "\n \n \n"
	echo -e "\n ------------------------------------"
	echo -e "installiere $prog"
	notify-send "$prog wird installiert"
	yay -Sy --noconfirm "$prog" >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"

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
sudo npm install -g tree-sitter --silent >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"
sudo npm install -g tree-sitter-cli --silent >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"
sudo npm install -g matlab-language-server --silent >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"
sudo npm install -g prettier --silent >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"

echo -e "\n \n \n ------yay Update------"
notify-send "yay Update"
yay -Syu --devel >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"
yay -Syu --timeupdate >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"

echo -e "\n \n \n ------pacman Update------"
notify-send "pacman Update"
sudo pacman -Syu --noconfirm >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"

echo "Ordner erstellen"
notify-send "Ordner werden erstellt"
cd /home/$user_name/ >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"
mkdir -p /home/$user_name/git1/arduino >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"
mkdir -p /home/$user_name/git1/config >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"
mkdir -p /home/$user_name/git1/doku >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"
mkdir -p /home/$user_name/git1/latex_vorlage >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"
mkdir -p /home/$user_name/git/ >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"
mkdir -p /home/$user_name/git1/hyprland >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"
mkdir -p /home/$user_name/git1/lazy >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"
mkdir -p ~/.config/nvim/lua/config/ >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"
mkdir -p ~/.config/nvim/lua/plugins/ >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"
mkdir -p ~/.config/hypr/ >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"
mkdir -p ~/.config/waybar/ >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"
mkdir -p ~/.config/kitty/ >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"

echo -e "\n \n \n ------Dateien clonen------"
notify-send "Dateien Werden geclont"
git clone https://github.com/tobil939/doku.git /home/$user_name/git1/doku >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"
git clone https://github.com/tobil939/config.git /home/$user_name/git1/config >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"
git clone https://github.com/tobil939/arduino.git /home/$user_name/git1/arduino >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"
git clone https://github.com/tobil939/latex_vorlage.git /home/$user_name/git1/latex_vorlage >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"
git clone https://github.com/tobil939/hyprland.git /home/$user_name/git1/hyprland >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"
git clone https://github.com/tobil939/lazy.git /home/$user_name/git1/lazy >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"
echo -e "\n \n \n ------Daten kopieren------"
# Dateien verschieben und alte löschen
cd /home/$user_name/git1/lazy/ >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"
echo -e "\n \n \n ------init.lua------"
notify-send "init.lua wird kopiert"
if [ -f ~/.config/nvim/init.lua ]; then
	sudo rm ~/.config/nvim/init.lua
fi
sudo cp init.lua ~/.config/nvim/init.lua >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"

echo -e "\n \n \n ------example.lua------"
notify-send "example wird kopiert"
if [ -f ~/.config/nvim/lua/plugins/example.lua ]; then
	sudo rm ~/.config/nvim/lua/plugins/example.lua
fi
sudo cp example.lua ~/.config/nvim/lua/plugins/example.lua >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"

echo -e "\n \n \n ------autocmds.lua------"
notify-send "autocmds wird kopiert"
if [ -f ~/.config/nvim/lua/config/autocmds.lua ]; then
	sudo rm ~/.config/nvim/lua/config/autocmds.lua
fi
sudo cp autocmds.lua ~/.config/nvim/lua/config/autocmds.lua >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"

echo -e "\n \n \n ------keymaps.lua------"
notify-send "keymaps werden kopiert"
if [ -f ~/.config/nvim/lua/config/keymaps.lua ]; then
	sudo rm ~/.config/nvim/lua/config/keymaps.lua
fi
sudo cp keymaps.lua ~/.config/nvim/lua/config/keymaps.lua >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"

echo -e "\n \n \n ------lazy.lua------"
notify-send "lazy werden kopiert"
if [ -f ~/.config/nvim/lua/config/lazy.lua ]; then
	sudo rm ~/.config/nvim/lua/config/lazy.lua
fi
sudo cp lazy.lua ~/.config/nvim/lua/config/lazy.lua >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"

echo -e "\n \n \n ------options.lua------"
notify-send "options werden kopiert"
if [ -f ~/.config/nvim/lua/config/options.lua ]; then
	sudo rm ~/.config/nvim/lua/config/options.lua
fi
sudo cp options.lua ~/.config/nvim/lua/config/options.lua >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"

echo -e "\n \n \n ------hyprland.conf------"
cd /home/$user_name/git1/hyprland
notify-send "hyprland werden kopiert"
if [ -f ~/.config/hypr/hyprland.conf ]; then
	sudo rm ~/.config/hypr/hyprland.conf
fi
sudo cp hyprland.conf ~/.config/hypr/hyprland.conf >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"

echo -e "\n \n \n ------waybar config------"
notify-send "waybar wird kopiert"
if [ -f ~/.config/waybar/config.jsonc ]; then
	sudo rm ~/.config/waybar/config.jsonc
fi
sudo cp config.jsonc ~/.config/waybar/config.jsonc >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"

echo -e "\n \n \n ------waybar style------"
if [ -f ~/.config/waybar/style.css ]; then
	sudo rm ~/.config/waybar/style.css
fi
sudo cp config.jsonc ~/.config/waybar/style.css >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"

echo -e "\n \n \n ------kitty conf------"
cd /home/$user_name/git1/config
notify-send "kitty wird kopiert"
if [ -f ~/.config/kitty/kitty.conf ]; then
	sudo rm ~/.config/kitty/kitty.conf
fi
sudo cp kitty.conf ~/.config/kitty/kitty.conf >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"

echo -e "\n \n \n ------bash------"
cd /home/$user_name/git1/latex_vorlage >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"
notify-send "bash wird erstellt für LaTeX"
if [ -f /usr/local/bin/tex.sh ]; then
	sudo rm /usr/local/bin/tex.sh
fi

sudo cp tex.sh /usr/local/bin/tex.sh >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"
cd /usr/local/bin/
sudo chmod +x tex.sh >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"

cd /home/$user_name/ >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"

echo -e "\n \n \n ------Update------"
sudo pacman -Syu --noconfirm >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"

echo -e "\n \n \n ------Dark Mode------"
gsettings set org.gnome.desktop.interface gtk-theme "Arc-Dark" >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"
gsettings set org.gnome.desktop.interface icon-theme "Adwaita" >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"
gsettings set org.gnome.shell.extensions.user-theme name "Adwaita" >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"
gsettings set org.gnome.desktop.interface color-scheme prefer-dark >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"

echo -e "\n \n \n ------bluetooth------"
sudo systemctl start bluetooth.service >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"
sudo systemctl enable bluetooth.service >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"

echo -e "\n \n \n ------neofetch einbinden------"
if ! grep -Fxq "neofetch" ~/.bashrc; then
	echo "neofetch" >>~/.bashrc >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"
	echo "neofetch hinzugefügt"
else
	echo "neofetch bereits vorhanden"
fi

echo -e "\n \n \n ------git config------"
echo -e "Benutzername: ?"
user_name=$(whoami)
echo -e "\n Benutzername: $user_name \n" >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"
read -p "Benutzername für git: " user_git
echo -e "\n Benutzername für git: $user_git \n" >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"
read -p "Emailadresse für git: " user_email
echo -e "\n Emailadresse für git: $user_email \n" >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"
git config --global user.name "$user_git" >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"
git config --global user.email "$user_email" >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"
git config --global core.editor nvim >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"

echo -e "\n \n \n ------fertig------"
#reboot
