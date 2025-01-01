#!/bin/bash

# Festplatte festlegen
dev1="/dev/sdb1"
dev2="/dev/sdb2"

# Mounting Punkt festlegen
mnt1="/mnt/usb1"
mnt2="/mnt/usb2"

# Programme installiert?
sudo fdisk -l
notify-send "ntfs-3g installiert?"
sudo pacman -Sy --noconfirm ntfs-3g
if lsblk | grep -q "$dev1"; then
	notify-send "Festplatte wurde gefunden"

	if [ ! -d "$mnt1" ]; then
		notify-send "Mounting Punkt erstellen"
		sudo mkdir -p "$mnt1"
	fi

	sudo mount -t ntfs-3g "$dev1" "$mnt1"
	notify-send "Festplatte eingehängt"
	if ! grep -Fxq "usb1" ~/.config/gtk-3.0/bookmarks; then
		echo "file://$mnt1 usb1" >>~/.config/gtk-3.0/bookmarks
		echo "usb1 hinzugefügt"
	else
		echo "usb1  bereits vorhanden"
	fi

else
	notify-send "Festplatte nicht eingehängt"
fi

if lsblk | grep -q "$dev2"; then
	notify-send "Festplatte wurde gefunden"

	if [ ! -d "$mnt2" ]; then
		notify-send "Mounting Punkt erstellen"
		sudo mkdir -p "$mnt2"
	fi

	sudo mount -t ntfs-3g "$dev2" "$mnt2"
	notify-send "Festplatte eingehängt"
	if ! grep -Fxq "usb2" ~/.config/gtk-3.0/bookmarks; then
		echo "file://$mnt2 usb2" >>~/.config/gtk-3.0/bookmarks
		echo "usb2 hinzugefügt"
	else
		echo "usb2  bereits vorhanden"
	fi

else
	notify-send "Festplatte nicht eingehängt"
fi
