#!/bin/bash

# Installing niri
echo -e "\033[1;32m|=== INSTALLING AND SETTING UP NIRI ===|\033[0m"
sudo dnf install niri -y
sudo systemctl --user add-wants niri.service dms
echo ""
