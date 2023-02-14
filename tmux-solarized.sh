#!/bin/bash
############################
#
############################

scheme=${1}

# echo hello 
# echo $(nvr --serverlist)
# echo hello2 
# tmux -c "nvr --serverlist"
tmux set -g @colors-solarized $scheme
~/dotfiles/set-solarized-terminal-theme.sh $scheme
tmux source-file ~/.tmux.conf
~/dotfiles/vim-servers-theme.sh $scheme
  
exit 0 
