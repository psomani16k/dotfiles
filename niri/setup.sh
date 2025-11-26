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
sudo mv ~/temp/niri/target/release/niri /usr/bin
sudo mv ~/temp/niri/resources/niri-session /usr/bin
sudo mc ~/temp/niri/resources/niri.service /etc/dinit.d/usr
# rm -rf ~/temp

# Installing from package manager
# echo -e "\033[1;32m|=== INSTALLING AND SETTING UP NIRI FROM PACKAGE ===|\033[0m"
# sudo dnf install niri -y
sudo systemctl --user add-wants niri.service dms
echo ""
