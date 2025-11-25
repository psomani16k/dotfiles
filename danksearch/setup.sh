#!/bin/bash

# Installing dsearch
echo -e "\033[1;32m|=== INSTALLING AND SETTINGUP DSEARCH ===|\033[0m"
sudo dnf copr enable avengemedia/danklinux
sudo dnf install dsearch
dms greeter enable
dms greeter sync
sudo systemctl disable gdm lightdm sddm
sudo systemctl enable greetd
echo ""
