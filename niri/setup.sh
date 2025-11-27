#!/bin/bash

# Installing niri
echo -e "\033[1;32m|=== INSTALLING AND SETTING UP NIRI FROM LATEST GIT ===|\033[0m"

# Building yourself
sudo dnf install -y gcc libudev-devel libgbm-devel libxkbcommon-devel wayland-devel libinput-devel dbus-devel systemd-devel libseat-devel pipewire-devel pango-devel cairo-gobject-devel clang libdisplay-info-devel
mkdir ~/temp
cd ~/temp
git clone https://github.com/YaLTeR/niri.git
cd niri
cargo build --release
sudo install -Dm644 -t /usr/lib/systemd/user ./resources/niri-shutdown.target
sudo install -Dm644 -t /usr/lib/systemd/user ./resources/niri.service
sudo install -Dm644 -t /usr/share/xdg-desktop-portal ./resources/niri-portals.conf
sudo install -Dm644 -t /usr/share/wayland-sessions ./resources/niri.desktop
sudo install -Dm755 -t /usr/bin ./resources/niri-session
# rm -rf ~/temp

# Installing from package manager
# echo -e "\033[1;32m|=== INSTALLING AND SETTING UP NIRI FROM PACKAGE ===|\033[0m"
# sudo dnf install niri -y
sudo systemctl --user add-wants niri.service dms
echo ""
