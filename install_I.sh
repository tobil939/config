#!/bin/bash

echo -e "Benutzername: ?"
user_name=$(whoami)
echo -e "\n Benutzername: $user_name \n"

# Installation von verschiedenen Paketen
echo -e "\n \n \n ------yay------"
cd /home/$user_name
sudo pacman -Sy --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd /home/$user_name

echo -e "\n \n \n ------wayland------"
yay -S wayland --noconfirm
echo -e "\n \n \n ------hyprland------"
yay -S hyprland --noconfirm
echo -e "\n \n \n ------nm-applet------"
yay -S nm-applet --noconfirm
echo -e "\n \n \n ------waybar------"
yay -S waybar --noconfirm
echo -e "\n \n \n ------swaync------"
yay -S swaync --noconfirm
echo -e "\n \n \n ------wofi------"
yay -S wofi --noconfirm
echo -e "\n \n \n ------hypridle------"
yay -S hypridle --noconfirm
echo -e "\n \n \n ------hyprlock------"
yay -S hyprlock --noconfirm
echo -e "\n \n \n ------hyprshot------"
yay -S hyprshot --noconfirm
echo -e "\n \n \n ------pavucontrol------"
yay -S pavucontrol --noconfirm
echo -e "\n \n \n ------qt5-wayland------"
yay -S qt5-wayland --noconfirm
echo -e "\n \n \n ------qt6-wayland------"
yay -S qt6-wayland --noconfirm
echo -e "\n \n \n ------polkit------"
yay -S polkit --noconfirm
echo -e "\n \n \n ------neofetch------"
yay -S neofetch --noconfirm
echo -e "\n \n \n ------kitty------"
yay -S kitty --noconfirm
echo -e "\n \n \n ------firefox------"
yay -S firefox --noconfirm
echo -e "\n \n \n ------gedit------"
yay -S gedit --noconfirm
echo -e "\n \n \n ------ttf-meslo-nerd------"
yay -S ttf-meslo-nerd --noconfirm
echo -e "\n \n \n ------picom------"
yay -S picom --noconfirm
echo -e "\n \n \n ------feh------"
yay -S feh --noconfirm
echo -e "\n \n \n ------git------"
yay -S git --noconfirm
echo -e "\n \n \n ------git cli------"
yay -S github-cli --noconfirm
echo -e "\n \n \n ------nautilus------"
yay -S nautilus --noconfirm
echo -e "\n \n \n ------timeshift------"
yay -S timeshift --noconfirm
echo -e "\n \n \n ------gtk------"
yay -S gtk2 --noconfirm
yay -S gtk3 --noconfirm
yay -S gtk4 --noconfirm
yay -S gtk-engine-murrine --noconfirm
echo -e "\n \n \n ------Dark Theme------"
yay -S gnome-themes-extra --noconfirm
yay -S arc-gtk-theme --noconfirm
echo -e "\n \n \n ------lxappearance------"
yay -S lxappearance --noconfirm
echo -e "\n \n \n ------todo list------"
yay -S endeavour --noconfirm
echo -e "\n \n \n ------PDF------"
yay -S evince --noconfirm
echo -e "\n \n \n ------LaTeX------"
yay -S texlive --noconfirm
yay -S texmaker --noconfirm
echo -e "\n \n \n ------Nitrogen------"
yay -S nitrogen --noconfirm
echo -e "\n \n \n ------Kalender------"
yay -S gnome-calendar --noconfirm
echo -e "\n \n \n ------Nvim------"
yay -S neovim --noconfirm
echo -e "\n \n \n ------C Umgebung------"
yay -S gcc --noconfirm
yay -S gdb --noconfirm
yay -S gdb-common --noconfirm
yay -S gdbgui --noconfirm
echo -e "\n \n \n ------py Umgebung------"
yay -S python3 --noconfirm
yay -S python-gdbgui --noconfirm
yay -S pdb --noconfirm
yay -S python python-pip --noconfirm
pip install numba --quiet
pip install dask --quiet
pip install pandas --quiet
pip install openpyxl --quiet
pip install numpy --quiet

# Update durchführen
echo -e "\n \n \n ------Update------"
yay -Syu --noconfirm

echo -e "\n \n \n ------Update pacman------"
sudo pacman -Syu --noconfirm

echo -e "\n \n \n ------npm------"
yay -S npm --noconfirm
echo -e "\n \n \n ------tree-sitter------"
sudo npm install -g tree-sitter
sudo npm install -g tree-sitter-cli
sudo npm install -g matlab-language-server

echo -e "\n \n \n ------yay Update------"
yay -Syu --devel
yay -Syu --timeupdate

#reboot
