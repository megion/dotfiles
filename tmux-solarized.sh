#!/bin/bash
############################
#
############################

scheme=${1}

tmux set -g @colors-solarized $scheme 
~/dotfiles/set-solarized-terminal-theme.sh $scheme
tmux source-file ~/.tmux.conf >/dev/null 2>&1
~/dotfiles/vim-servers-theme.sh $scheme >/dev/null 2>&1
  
exit 0 
