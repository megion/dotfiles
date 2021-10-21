#!/bin/bash
############################
# This script set solarized theme for terminal:
# linux - gnome terminal
# cygwin - mintty

# Usage: ./set-solarized-terminal-theme.sh dark<light>

#mkdir ~/workspaces/configs
#cd ~/workspaces/configs

# 1. Gnome termial initial steps:
# git clone https://github.com/Anthony25/gnome-terminal-colors-solarized.git 
# create gnome terminal profile `my_solarized`

# 2. Mintty termial initial steps:
# git clone https://github.com/megion/mintty-colors-solarized.git 
# git clone https://github.com/seebi/dircolors-solarized.git

############################


########## Variables
gnomeThemeDir=~/workspaces/configs/gnome-terminal-colors-solarized
xfce4ThemeDir=~/workspaces/configs/xfce4-terminal-colors-solarized
minttyThemeDir=~/workspaces/configs/mintty-colors-solarized
dircolorsDir=~/workspaces/configs/dircolors-solarized
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

if [ $os == "LINUX" ]; then
    #echo "~/dotfiles/xfce4-terminalrc-$scheme"
    cp ~/dotfiles/xfce-terminalrc-$scheme ~/.config/xfce4/terminal/terminalrc
	#echo "use gnome theme"
    cd $gnomeThemeDir
    ./install.sh -s $scheme -p $profile --skip-dircolors
elif [ $os == "Cygwin" ]; then
	#echo "use Cygwin theme"
    cd $minttyThemeDir
    ./set-theme.sh $scheme
    cd $dircolorsDir
    eval "$(dircolors $dircolorsDir/dircolors.ansi-$scheme)"
else 
	echo "not supported OS"
fi



