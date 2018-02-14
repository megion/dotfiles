#!/bin/bash
############################
# This script set solarized theme for terminal:
# linux - gnome terminal
# cygwin - mintty

# Usage: ./set-solarized-terminal-theme.sh dark<light>


# 1. Gnome termial initial steps:
#mkdir ~/workspaces/configs
#cd ~/workspaces/configs
#git clone https://github.com/Anthony25/gnome-terminal-colors-solarized.git 

# 2. Mintty termial initial steps:
# git clone https://github.com/mavnn/mintty-colors-solarized.git
# cd mintty-colors-solarized 
# chmod +x sol.dark sol.light 

############################


########## Variables
gnomeThemeDir=~/workspaces/configs/gnome-terminal-colors-solarized
minttyThemeDir=~/workspaces/configs/mintty-colors-solarized
profile=my_solarized
scheme=${1}

case "$OSTYPE" in
  linux*)   os="LINUX" ;;
  darwin*)  os="OSX" ;; 
  win*)     os="Windows" ;;
  cygwin*)  os="Cygwin" ;;
  bsd*)     os="BSD" ;;
  solaris*) os="SOLARIS" ;;
  *)        os="unknown: $OSTYPE" ;;
esac

echo "OS '$os'"

if [ $os == "LINUX" ]; then
	echo "use gnome theme"
    cd $gnomeThemeDir
    #./install.sh -h
    ./install.sh -s $scheme -p $profile --skip-dircolors
elif [ $os == "Cygwin" ]; then
	echo "use Cygwin theme"
    cd $minttyThemeDir
    printf '\ePtmux;\e\e]4;1;#aa0000\a\e\\'
    if [ $scheme == "dark" ]; then
        ./sol.dark
    elif [ $scheme == "light" ]; then
        ./sol.light
    else 
        echo "NO background"
    fi

	echo "fix tmux"
else 
	echo "not supported OS"
fi



