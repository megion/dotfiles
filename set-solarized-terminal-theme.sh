#!/bin/bash
############################
# This script set solarized theme for terminal:
# linux - gnome terminal
# cygwin - mintty

# Usage: ./set-solarized-terminal-theme.sh dark<light>

#mkdir ~/workspaces/configs
#cd ~/workspaces/configs

# 1. Gnome termial initial steps:
# create gnome terminal profile `my_solarized`

# 2. Mintty termial initial steps:
# git clone https://github.com/megion/mintty-colors-solarized.git 

# 3. Common
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

# Define your desired color scheme
# Canonical Solarized Light
# NEW_SCHEME="Solarized ($scheme) (terminal.sexy)"

# Path to your wezterm.lua
# WEZTERM_CONFIG="$HOME/dotfiles/wezterm/wezterm.lua"

function dark() {
    ln -fs ~/.config/alacritty/themes/themes/solarized_dark.toml ~/.config/alacritty/themes/_active.toml
    touch ~/.config/alacritty/alacritty.toml
}
function light() {
    ln -fs ~/.config/alacritty/themes/themes/solarized_light.toml ~/.config/alacritty/themes/_active.toml
    touch ~/.config/alacritty/alacritty.toml
}

# wezterm_theme="hello"
# if [ "$scheme" == "dark" ]; then
#     # wezterm_theme="Solarized (dark) (terminal.sexy)"
#     # wezterm_theme="Solarized Dark (Gogh)"
#     wezterm_theme="Canonical Solarized Dark"
# else
#     # wezterm_theme="Solarized (light) (terminal.sexy)"
#     # wezterm_theme="Solarized Light (Gogh)"
#     wezterm_theme="Canonical Solarized Light"
# fi
#
# echo "$wezterm_theme"
# echo "$NEW_SCHEME"

# sed -i "s/^config.color_scheme = '.*'/config.color_scheme = '$wezterm_theme'/" "$WEZTERM_CONFIG"


if [ "$scheme" == "dark" ]; then
    dark
else 
    light
fi

        #echo "$os"
#if [ $os == "LINUX" ]; then
    ## cp ~/dotfiles/xfce4-terminal-$scheme.xml ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-terminal.xml
    #echo "$os"
    #if [ "$scheme" == "dark" ]; then
        #xfconf-query -c xfce4-terminal -p /color-foreground -s "#839496"
        #xfconf-query -c xfce4-terminal -p /color-background -s "#002b36"
        #xfconf-query -c xfce4-terminal -p /color-cursor -s "#93a1a1"
        #xfconf-query -c xfce4-terminal -p /color-bold -s "#93a1a1"
        #xfconf-query -c xfce4-terminal -p /color-palette -s "#073642;#dc322f;#859900;#b58900;#268bd2;#d33682;#2aa198;#eee8d5;#002b36;#cb4b16;#586e75;#657b83;#839496;#6c71c4;#93a1a1;#fdf6e3"
        ## xfconf-query -c xfce4-terminal -p /color-palette -s "#073642;#dc322f;#859900;#b58900;#268bd2;#d33682;#2aa198;#eee8d5;#475b62;#cb4b16;#586e75;#657b83;#839496;#6c71c4;#93a1a1;#fdf6e3"
    #elif 
        #xfconf-query -c xfce4-terminal -p /color-foreground -s "#657b83"
        #xfconf-query -c xfce4-terminal -p /color-background -s "#fdf6e3"
        #xfconf-query -c xfce4-terminal -p /color-cursor -s "#586e75"
        #xfconf-query -c xfce4-terminal -p /color-bold -s "#073642"
        #xfconf-query -c xfce4-terminal -p /color-palette -s "#eee8d5;#dc322f;#859900;#b58900;#268bd2;#d33682;#2aa198;#eee8d5;#002b36;#cb4b16;#586e75;#657b83;#839496;#6c71c4;#93a1a1;#fdf6e3"
    #fi
#elif [ "$os" == "Cygwin" ]; then
	##echo "use Cygwin theme"
    #cd $minttyThemeDir
    #./set-theme.sh $scheme
#else 
	#echo "not supported OS"
#fi

# see https://github.com/seebi/dircolors-solarized
# export TERM=xterm-256color        # for common 256 color terminals (e.g. gnome-terminal)
# export TERM=screen-256color       # for a tmux -2 session (also for screen)

#cd $dircolorsDir
if [ "$scheme" == "light" ]; then
    eval "$(dircolors $dircolorsDir/dircolors.ansi-light)"
else 
    eval `dircolors $dircolorsDir/dircolors.256dark`
fi

#eval `dircolors $dircolorsDir/dircolors.256dark`
