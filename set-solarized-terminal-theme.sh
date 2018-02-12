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


########## Variables
gnomeThemeDir=~/workspaces/configs/gnome-terminal-colors-solarized
profile=my_solarized
scheme=${1}

cd $gnomeThemeDir
#./install.sh -s $scheme -p $profile --skip-dircolors


case "$OSTYPE" in
  linux*)   os="LINUX" ;;
  darwin*)  os="OSX" ;; 
  win*)     os="Windows" ;;
  cygwin*)  os="Cygwin" ;;
  bsd*)     os="BSD" ;;
  solaris*) os="SOLARIS" ;;
  *)        os="unknown: $OSTYPE" ;;
esac

echo $os



