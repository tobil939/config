#!/bin/bash

# Suchen nach Updates und installieren
echo -e "\n \n \n ------Update------"
sudo pacman -Syu --noconfirm >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE" # nochmals nach Updates schauen und installieren
yay -Syu --noconfirm >>"$LOG_FILE" 2>>"$ERROR_LOG_FILE"
