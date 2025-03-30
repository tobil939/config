#!/bin/bash

echo -e "Benutzername: ?"
user_name=$(whoami)
LOG_FILE="/home/$user_name/log/install.log"
ERROR_LOG_FILE="/home/$user_name/log/errorinstall.log"
datef="$(date '+%Y-%m-%d %H:%M:%S')"
echo -e "\n $datef Benutzername: $user_name \n" >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"

echo -e "\n \n \n ------keyring update------"
sudo pacman -Sy archlinux-keyring --noconfirm >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"

echo -e "\n \n \n ------Pacman------"
sudo pacman -Syu --noconfirm >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"

echo -e "\n \n \n ------yay------"
sudo yay -Syu --noconfirm >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"

echo -e "\n \n \n ------npm------"
sudo npm update -g --yes >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"
#reboot
