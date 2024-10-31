#!/bin/bash

# Skript das mir helfen sollen meine Installation und Einrichtugn bei Arch Linux zu erleichtern
# Stand 2024-10-28 Einrichtugn und Installation von Hyprland, Neovim, LaTeX, Python und C
# Packete werden mit pacman, yay, npm installiert

echo -e "Benutzername: ?" # Benutzernamen herausfinden
user_name=$(whoami)
mkdir -p /home/$user_name/log/error                                                # LOG Ordner erstellen
LOG_FILE="/home/$user_name/log/install.log"                                        # LOG allgemein
ERROR_LOG_FILE="/home/$user_name/log/error/errorinstall.log"                       # LOG Error
datef="$(date '+%Y-%m-%d %H:%M:%S')"                                               # Datum formatieren
echo -e "\n $datef Benutzername: $user_name \n" >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE" # Erste LOG Einträge

# Bitte hier die Progamme angeben die installiert werden sollen
# pacman
progpac=(
	"wayland"                # Protokoll für Hyprland, Nachfolger von X11
	"hyprland"               # Windowmanager, Nachfolger von i3wm
	"network-manager-applet" # gui für Netzwerkmanager
	"texlive"                # Compiler für LaTeX
	"texmaker"               # Editor für LateX, bessere Hilfe beim Fehlersuchen
	"texlive-most"           # Formatter für LaTeX in nvim
	"gnome-calendar"         # Kalender
	"python3"                # Python 3 Compiler
	"python-numba"           # Numba lib, compiliert Funktionen
	"python-dask"            # Dask lib, mehrere Prozesse
	"python-pandas"          # Pandas lib,
	"python-numpy"           # NumPy lib,
	"python-openpyxl"        # Openpyxl lib, einlsesn von Inhalten aus Excel
	"python-libusb1"         # Libusb1 lib, enthält ctypes
	"python-black"           # Formater für Python in nvim
	"clang"                  # Unteranderem Formater für C in nvim
	"vlc"                    # VLC Player
	"ntfs-3g"
)

# yay
progyay=(
	"polkit"             # Mh? Wird für Hyprland benötigt
	"waybar"             # Statusleiste für Hyprland
	"swaync"             # Notification Deamon
	"wofi"               # Applauncher für Hyprland
	"hypridle"           # Deamon um zu sehen ob es aktive Prozesse gibt
	"hyprlock"           # Sperrbildschirm für Hyprland
	"hyprshot"           # Screenshots erstellen
	"pavucontrol"        # Gui zum Audiokontroller
	"qt5-wayland"        # Toolkit für Grafiken
	"qt6-wayland"        # Toolkit für Grafiken
	"neofetch"           # Systemanzeige im Terminal
	"kitty"              # Kitty Terminal
	"firefox"            # Firefox Browser
	"gedit"              # Editor
	"ttf-meslo-nerd"     # Schriftarten
	"picom"              # Composer
	"feh"                # Viewer für Bilder
	"git"                # Versionierungstool
	"github-cli"         # Terminalanwendung für git
	"nautilus"           # Datenexplorer gtk basis
	"dolphin"            # Datenexplorer qt basis
	"timeshift"          # erstellt Backups vom System
	"gtk2"               # Toolkit für Grafiken
	"gtk3"               # Toolkit für Grafiken
	"gtk4"               # Toolkit für Grafiken
	"arc-gtk-theme"      # Dunkler Hintergrund
	"gtk-engine-murrine" # Anzeigenhilfe für dunkle Hintergründe
	"lxappearance"       # Einstellungsmöglichkeit für Hintergründe
	"endeavour"          # ToDo List
	"evince"             # PDF Viewer
	"nitrogen"           # Auswahlhilfe für Hintergrundbilder
	"neovim"             # Neovim, mit config LazyVim
	"gcc"                # Compiler fúr C
	"gdb"                # Debugger für unteranderem C
	"gdb-common"         # Debugger Erweiterung
	"npm"                # Packetmanager JavaScript
	"libreoffice-still"  # Open Office
	"bluez"              # Bluetooth Zeug
	"bluez-utils"        # Bluetooth Zeug
	"blueman"            # Bluetooth Zeug
	"python-gdbgui"      # gui für Debugger
	"pdb"                # Debugger für Python
	"gdbgui"             # gui für Debugger
	"vlc-arc-dark-git"   # dark theme für VLC
)

# installieren von pacman Programmen
n=0                             # Zähler für richtig installierte Programme
m=0                             # Zähler für Programme die nicht installiert wurden
for prog in "${progpac[@]}"; do # Schleife die die Progammliste druchläuft
	echo -e "\n \n \n"
	echo -e "\n ------------------------------------"
	echo -e "installiere $prog"
	notify-send "$prog wird installiert"                                   # Nachricht an den Notification Daemon schicken
	sudo pacman -Sy --noconfirm "$prog" >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE" # installiert die Programme, erzeugt LOG Einträge

	if [ $? -eq 0 ]; then # Abfrage ob Programm richtig installiert wird
		echo -e "$prog wurde erfolgreich installiert"
		notify-send "$prog wurde erfolgreich installiert"
		((n++)) # Zählt wie viele Programme installiert wurden
	else
		echo -e "$prog wurde nicht richig installiert"
		notify-send "$prog wurde nicht richtig installiert"
		((m++)) # zählt wie viele Programme nicht installiert wurden
	fi
done

notify-send "$n wurden richtig installiert"
notify-send "$m Fehler beim installieren"
echo -e "\n \n \n -----------------------------------" >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE" # LOG Einträge über die Anzahl der Programme
echo -e "\n Es wurden $n richtig installiert" >>"$LOG_FILE"
echo -e "\n Es gab $m die nicht installierrt wurden" 2>>"$ERROR_LOG_FILE"

# Installation von yay
echo -e "\n \n \n ------yay------"
cd /home/$user_name
sudo pacman -Sy --needed git base-devel --noconfirm >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE" # yay wird installiert
git clone https://aur.archlinux.org/yay.git
cd yay >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"
makepkg -si --noconfirm
cd /home/$user_name >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"

# installieren von yay Programmen
n=0
m=0
for prog in "${progyay[@]}"; do
	echo -e "\n \n \n"
	echo -e "\n ------------------------------------"
	echo -e "installiere $prog"
	notify-send "$prog wird installiert"
	yay -Sy --noconfirm "$prog" >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE" # Programme werden mit yay installiert

	if [ $? -eq 0 ]; then # Abfrage ob die Programme richtig installiert wurden
		echo -e "$prog wurde erfolgreich installiert"
		notify-send "$prog wurde erfolgreich installiert"
		((n++))
	else
		echo -e "$prog wurde nicht richig installiert"
		notify-send "$prog wurde nicht richtig installiert"
		((m++))
	fi
done

notify-send "$n wurden richtig installiert"
notify-send "$m Fehler beim installieren"
echo -e "\n \n \n -----------------------------------" >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE" # LOG Einträge über die Anzahl der Programme
echo -e "\n Es wurden $n richtig installiert" >>"$LOG_FILE"
echo -e "\n Es gab $m die nicht installierrt wurden" 2>>"$ERROR_LOG_FILE"

echo -e "\n \n \n ------npm------"
echo -e "\n \n \n ------tree-sitter------"
notify-send "tree sitter wird installiert"
sudo npm install -g tree-sitter --silent >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"            # Treesitter wird installiert
sudo npm install -g tree-sitter-cli --silent >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"        # Terminalbefehle für Treesitter
sudo npm install -g matlab-language-server --silent >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE" # LSP für Matlab

echo -e "\n \n \n ------yay Update------"
notify-send "yay Update"
yay -Syu --devel >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE" # Programme des AUR (yay) werden upgedated
yay -Syu --timeupdate >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"

echo -e "\n \n \n ------pacman Update------"
notify-send "pacman Update"
sudo pacman -Syu --noconfirm >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE" # Programme werden über pacman upgedated

# Ordnerstrukturen werden erstellt
# git sollte für Daten sein die später auf git gepuhst werden sollen
# git1 Daten die von git geclont werden
echo "Ordner erstellen" # Ornderstrukturen werden erstellt
notify-send "Ordner werden erstellt"
cd /home/$user_name/ >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"
mkdir -p /home/$user_name/git1/arduino >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"
mkdir -p /home/$user_name/git1/config >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"
mkdir -p /home/$user_name/git1/doku >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"
mkdir -p /home/$user_name/git1/latex_vorlage >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"
mkdir -p /home/$user_name/git/ >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"
mkdir -p /home/$user_name/git1/hyprland >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"
mkdir -p /home/$user_name/git1/lazy >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"
mkdir -p /home/$user_name/Scripts >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"

# Ordnerstrukturen für Configdateien werden angelegt
mkdir -p ~/.config/nvim/lua/config/ >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE" # Ordnerstrukturen für Configdateien werden erstellt
mkdir -p ~/.config/nvim/lua/plugins/ >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"
mkdir -p ~/.config/hypr/ >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"
mkdir -p ~/.config/waybar/ >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"
mkdir -p ~/.config/kitty/ >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"

# Repos von git werden geclont
echo -e "\n \n \n ------Dateien clonen------"
notify-send "Dateien Werden geclont" # gitrepo wird geclont
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
sudo cp init.lua ~/.config/nvim/init.lua >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE" # init.lua

echo -e "\n \n \n ------example.lua------"
notify-send "example wird kopiert"
if [ -f ~/.config/nvim/lua/plugins/example.lua ]; then
	sudo rm ~/.config/nvim/lua/plugins/example.lua
fi
sudo cp example.lua ~/.config/nvim/lua/plugins/example.lua >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE" # exampel.lua

echo -e "\n \n \n ------autocmds.lua------"
notify-send "autocmds wird kopiert"
if [ -f ~/.config/nvim/lua/config/autocmds.lua ]; then
	sudo rm ~/.config/nvim/lua/config/autocmds.lua
fi
sudo cp autocmds.lua ~/.config/nvim/lua/config/autocmds.lua >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE" # autocmds.lua

echo -e "\n \n \n ------keymaps.lua------"
notify-send "keymaps werden kopiert"
if [ -f ~/.config/nvim/lua/config/keymaps.lua ]; then
	sudo rm ~/.config/nvim/lua/config/keymaps.lua
fi
sudo cp keymaps.lua ~/.config/nvim/lua/config/keymaps.lua >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE" # keymaps.lua

echo -e "\n \n \n ------lazy.lua------"
notify-send "lazy werden kopiert"
if [ -f ~/.config/nvim/lua/config/lazy.lua ]; then
	sudo rm ~/.config/nvim/lua/config/lazy.lua
fi
sudo cp lazy.lua ~/.config/nvim/lua/config/lazy.lua >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE" # lazy.lua

echo -e "\n \n \n ------options.lua------"
notify-send "options werden kopiert"
if [ -f ~/.config/nvim/lua/config/options.lua ]; then
	sudo rm ~/.config/nvim/lua/config/options.lua
fi
sudo cp options.lua ~/.config/nvim/lua/config/options.lua >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE" # options.lua

echo -e "\n \n \n ------hyprland.conf------"
cd /home/$user_name/git1/hyprland
notify-send "hyprland werden kopiert"
if [ -f ~/.config/hypr/hyprland.conf ]; then
	sudo rm ~/.config/hypr/hyprland.conf
fi
sudo cp hyprland.conf ~/.config/hypr/hyprland.conf >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE" # hyprland.conf

echo -e "\n \n \n ------waybar config------"
notify-send "waybar wird kopiert"
if [ -f ~/.config/waybar/config.jsonc ]; then
	sudo rm ~/.config/waybar/config.jsonc
fi
sudo cp config.jsonc ~/.config/waybar/config.jsonc # waybar config.jsonc

echo -e "\n \n \n ------waybar style------"
if [ -f ~/.config/waybar/style.css ]; then
	sudo rm ~/.config/waybar/style.css
fi
sudo cp config.jsonc ~/.config/waybar/style.css # waybar style.css

echo -e "\n \n \n ------kitty conf------"
cd /home/$user_name/git1/config
notify-send "kitty wird kopiert"
if [ -f ~/.config/kitty/kitty.conf ]; then
	sudo rm ~/.config/kitty/kitty.conf
fi
sudo cp kitty.conf ~/.config/kitty/kitty.conf >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE" # kitty.conf

# tex.sh ist eine bash zum compilieren von LaTeX
# erstellt die pdf von einer tex Datei
echo -e "\n \n \n ------bash------"
cd /home/$user_name/git1/latex_vorlage >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"
notify-send "bash wird erstellt für LaTeX"
if [ -f /usr/local/bin/tex.sh ]; then
	sudo rm /usr/local/bin/tex.sh
fi

sudo cp tex.sh /usr/local/bin/tex.sh >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE" # tex.sh
cd /usr/local/bin/
sudo chmod +x tex.sh >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE" # tex.sh ausführbar machen

cd /home/$user_name/ >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"

cd /home/$user_name/git1/config >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"
notify-send "bash wird erstellt für USB Mounting"
if [ -f /home/$user_name/Scripts/mnt2.sh ]; then
	sudo rm /home/$user_name/Scripts/mnt2.sh
fi

sudo cp mnt2.sh /usr/local/bin/mnt2.sh >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE" # mnt2.sh
cd /usr/local/bin
sudo chmod +x mnt2.sh >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE" # mnt2.sh ausführbar machen

cd /home/$user_name/ >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"

# Suchen nach Updates und installieren
echo -e "\n \n \n ------Update------"
sudo pacman -Syu --noconfirm >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE" # nochmals nach Updates schauen und installieren
yay -Syu --noconfirm >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"

# Umstellen auf Dark Mode
echo -e "\n \n \n ------Dark Mode------"
gsettings set org.gnome.desktop.interface gtk-theme "Arc-Dark" >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"
gsettings set org.gnome.desktop.interface icon-theme "Adwaita" >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"
gsettings set org.gnome.shell.extensions.user-theme name "Adwaita" >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"
gsettings set org.gnome.desktop.interface color-scheme prefer-dark >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"

# Aktivieren von Bluetooth
echo -e "\n \n \n ------bluetooth------"
sudo systemctl start bluetooth.service >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"  # bluetooth starten
sudo systemctl enable bluetooth.service >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE" # bluetooth beim starten aktivieren

# neofetch in das Terminal einfügen
echo -e "\n \n \n ------neofetch einbinden------"
if ! grep -Fxq "neofetch" ~/.bashrc; then
	echo "neofetch" >>~/.bashrc >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE" # neofetch in die .bashrc schreiben
	echo "neofetch hinzugefügt"
else
	echo "neofetch bereits vorhanden"
fi

# git einrichten
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
