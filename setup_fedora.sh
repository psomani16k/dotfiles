#!/bin/bash

# Any script that acts as a init script
# that other scripts depend on comes here 
source ./setup_misc/setup.sh

# Setup alacritty
source ./alacritty/setup.sh

# Setup fish
source ./fish/setup.sh

# Setup zellij
source ./zellij/setup.sh

# Setup neovim
source ./nvim/setup.sh
