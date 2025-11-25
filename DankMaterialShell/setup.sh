#!/bin/bash

# Installing dms
echo -e "\033[1;32m|=== INSTALLING AND SETTINGUP DANK MATERIAL SHELL ===|\033[0m"
sudo dnf copr enable avengemedia/dms
sudo dnf install dms
sudo systemctl --user add-wants dms
echo ""

# Installing dank greeter
echo -e "\033[1;32m|=== INSTALLING AND SETTINGUP DANK GREETER ===|\033[0m"
sudo dnf copr enable avengemedia/danklinux
sudo dnf install dms-greeter
dms greeter enable
dms greeter sync
sudo systemctl disable gdm lightdm sddm
sudo systemctl enable greetd
echo ""

