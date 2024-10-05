# Git-Ordner erstellen und klonen
echo -e "Benutzername: ?"
user_name=$(whoami)
echo -e "\n Benutzername: $user_name \n"
echo "Ordner erstellen"
cd /home/$user_name/
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
sudo cp tex.sh /usr/local/bin/tex.sh
cd /usr/local/bin/
sudo chmod +x tex.sh
cd /home/$user_name/

echo -e "\n \n \n Update"
sudo pacman -Syu --noconfirm

echo -e "\n \n \n Dark Mode"
gsettings set org.gnome.desktop.interface gtk-theme "Arc-Dark"
gsettings set org.gnome.desktop.interface icon-theme "Adwaita"
gsettings set org.gnome.shell.extensions.user-theme name "Adwaita"

echo -e "\n \n \n neofetch einbinden"
if ! grep -Fxq "neofetch" ~/.bashrc; then
  echo "neofetch" >>~/.bashrc
  echo "neofetch hinzugefügt"
else
  echo "neofetch bereits vorhanden"
fi

echo -e "\n \n \n fertig"
