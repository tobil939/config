# Git-Ordner erstellen und klonen
echo -e "Benutzername: ?"
user_name=$(whoami)
echo -e "\n \n \n ------Benutzername: $user_name ------ \n"
echo "Ordner erstellen"
cd /home/$user_name/
mkdir -p /home/$user_name/git1/arduino
mkdir -p /home/$user_name/git1/config
mkdir -p /home/$user_name/git1/hyprland
mkdir -p /home/$user_name/git1/lazy
mkdir -p /home/$user_name/git1/doku
mkdir -p /home/$user_name/git1/latex_vorlage
mkdir -p /home/$user_name/git/

echo -e "\n \n \n ------Dateien clonen------"
git clone https://github.com/tobil939/doku.git /home/$user_name/git1/doku
git clone https://github.com/tobil939/arduino.git /home/$user_name/git1/arduino
git clone https://github.com/tobil939/latex_vorlage.git /home/$user_name/git1/latex_vorlage
git clone https://github.com/tobil939/config.git /home/$user_name/git1/config
git clone https://github.com/tobil939/hyprland.git /home/$user_name/git1/hyprland
git clone https://github.com/tobil939/lazy.git /home/$user_name/git1/lazy

# Verzeichnisse für nvim und i3 erstellen, falls nicht vorhanden
echo -e "\n \n \n ------Ordner werden erstellt------"
cd ..
cd ..
if [ ! -d "~/.config/nvim/lua/config/" ]; then
  mkdir -p ~/.config/nvim/lua/config/
fi

if [ ! -d "~/.config/nvim/lua/plugins/" ]; then
  mkdir -p ~/.config/nvim/lua/plugins/
fi

if [ ! -d "~/.config/hypr/" ]; then
  mkdir -p ~/.config/hypr/
fi

if [ ! -d "~/.config/waybar/" ]; then
  mkdir -p ~/.config/waybar/
fi

if [ ! -d "~/.config/kitty/" ]; then
  mkdir -p ~/.config/kitty/
fi

echo -e "\n \n \n ------Daten kopieren------"
# Dateien verschieben und alte löschen
cd /home/$user_name/git1/lazy/
echo -e "\n \n \n ------init.lua------"
if [ -f ~/.config/nvim/init.lua ]; then
  sudo rm ~/.config/nvim/init.lua
fi
sudo cp init.lua ~/.config/nvim/init.lua

echo -e "\n \n \n ------example.lua------"
if [ -f ~/.config/nvim/lua/plugins/example.lua ]; then
  sudo rm ~/.config/nvim/lua/plugins/example.lua
fi
sudo cp example.lua ~/.config/nvim/lua/plugins/example.lua

echo -e "\n \n \n ------autocmds.lua------"
if [ -f ~/.config/nvim/lua/config/autocmds.lua ]; then
  sudo rm ~/.config/nvim/lua/config/autocmds.lua
fi
sudo cp autocmds.lua ~/.config/nvim/lua/config/autocmds.lua

echo -e "\n \n \n ------keymaps.lua------"
if [ -f ~/.config/nvim/lua/config/keymaps.lua ]; then
  sudo rm ~/.config/nvim/lua/config/keymaps.lua
fi
sudo cp keymaps.lua ~/.config/nvim/lua/config/keymaps.lua

echo -e "\n \n \n ------lazy.lua------"
if [ -f ~/.config/nvim/lua/config/lazy.lua ]; then
  sudo rm ~/.config/nvim/lua/config/lazy.lua
fi
sudo cp lazy.lua ~/.config/nvim/lua/config/lazy.lua

echo -e "\n \n \n ------options.lua------"
if [ -f ~/.config/nvim/lua/config/options.lua ]; then
  sudo rm ~/.config/nvim/lua/config/options.lua
fi
sudo cp options.lua ~/.config/nvim/lua/config/options.lua

cd /home/$user_name/git1/hyprland/
echo -e "\n \n \n ------hyprland.conf------"
if [ -f ~/.config/hypr/hyprland.conf ]; then
  sudo rm ~/.config/hypr/hyprland.conf
fi
sudo cp hyprland.conf ~/.config/hypr/hyprland.conf

if [ -f ~/.config/waybar/style.css ]; then
  sudo rm ~/.config/waybar/style.css
fi
sudo cp style.css ~/.config/waybar/style.css

if [ -f ~/.config/waybar/config.jsonc ]; then
  sudo rm ~/.config/waybar/config.jsonc
fi
sudo cp style.css ~/.config/waybar/config.jsonc

cd /home/$user_name/git1/config/
echo -e "\n \n \n ------kitty conf------"
if [ -f ~/.config/kitty/kitty.conf ]; then
  sudo rm ~/.config/kitty/kitty.conf
fi
sudo cp kitty.conf ~/.config/kitty/kitty.conf

echo -e "\n \n \n ------bash------"
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
sudo yay -Syu

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

echo -e "\n \n \n ------fertig------"

