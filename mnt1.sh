#!/bin/bash

# Festplatte festlegen
dev1="/dev/sdb1"
dev2="/dev/sdb2"

# Mounting Punkte festlegen
mnt1="/mnt/usb1"
mnt2="/mnt/usb2"

# Überprüfen und Installieren von ntfs-3g
if ! command -v ntfs-3g &>/dev/null; then
	notify-send "ntfs-3g wird installiert..."
	sudo pacman -Sy --noconfirm ntfs-3g
fi

# Funktion zum Hinzufügen eines Lesezeichens
add_bookmark() {
	local mount_point="$1"
	local name="$2"
	local bookmark_entry="file://$mount_point $name"

	if ! grep -Fxq "$bookmark_entry" ~/.config/gtk-3.0/bookmarks; then
		echo "$bookmark_entry" >>~/.config/gtk-3.0/bookmarks
		notify-send "Lesezeichen hinzugefügt" "$name wurde zu Nautilus hinzugefügt."
	else
		notify-send "Lesezeichen existiert bereits" "$name ist bereits als Lesezeichen vorhanden."
	fi
}

# Festplatte 1 prüfen und einhängen
if lsblk | grep -q "$dev1"; then
	notify-send "Festplatte $dev1 gefunden."

	if [ ! -d "$mnt1" ]; then
		notify-send "Mount-Punkt $mnt1 wird erstellt."
		sudo mkdir -p "$mnt1"
	fi

	if sudo mount -t ntfs-3g "$dev1" "$mnt1"; then
		notify-send "Festplatte $dev1 erfolgreich eingehängt bei $mnt1"
		add_bookmark "$mnt1" "usb1"
	else
		notify-send "Fehler beim Einhängen von $dev1"
	fi
else
	notify-send "Festplatte $dev1 nicht gefunden oder nicht eingesteckt."
fi

# Festplatte 2 prüfen und einhängen
if lsblk | grep -q "$dev2"; then
	notify-send "Festplatte $dev2 gefunden."

	if [ ! -d "$mnt2" ]; then
		notify-send "Mount-Punkt $mnt2 wird erstellt."
		sudo mkdir -p "$mnt2"
	fi

	if sudo mount -t ntfs-3g "$dev2" "$mnt2"; then
		notify-send "Festplatte $dev2 erfolgreich eingehängt bei $mnt2"
		add_bookmark "$mnt2" "usb2"
	else
		notify-send "Fehler beim Einhängen von $dev2"
	fi
else
	notify-send "Festplatte $dev2 nicht gefunden oder nicht eingesteckt."
fi
