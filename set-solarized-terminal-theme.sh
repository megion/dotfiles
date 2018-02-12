#!/bin/bash
############################
# This script set solarized theme for terminal:
# linux - gnome terminal
# cygwin - mintty

# 1. Gnome termial initial steps:
#mkdir ~/workspaces/configs
#cd ~/workspaces/configs
#git clone https://github.com/Anthony25/gnome-terminal-colors-solarized.git 

# 2. Mintty termial initial steps:

############################


cd ~/dotfiles/set-solarized-terminal-theme.sh
########## Variables

cd ~/workspaces/configs/gnome-terminal-colors-solarized
./install.sh -s dark -p my_solarized --skip-dircolors



