#!/bin/bash
############################
# start vim as server:
#
# vimx --servername myvim-server
#
############################

scheme=${1}

for instance in $(vim --serverlist); do
  if [ $scheme == "dark" ]; then
    vim --servername $instance --remote-send $'\e:source ~/dotfiles/solarized-dark.vim\n'
  elif [ $scheme == "light" ]; then
    vim --servername $instance --remote-send $'\e:source ~/dotfiles/solarized-light.vim\n'
  else
    echo "NO background"
  fi
done

# see
# https://github.com/neovim/neovim/issues/33150
# https://github.com/eylles/pywal-extra/tree/master/scripts/nvim-colo-reload
pipe="${XDG_RUNTIME_DIR:-/tmp}/nvim.pipe"

for pipe_instance in "${pipe}"/nvim.*.pipe; do
  # $nv_bin --server "$pipe_instance" --remote-send ":${1}<CR>"
  if [ $scheme == "dark" ]; then
    nvim --server "$pipe_instance" --remote-send $'\e:source ~/dotfiles/solarized-dark.vim\n'
  elif [ $scheme == "light" ]; then
    nvim --server "$pipe_instance" --remote-send $'\e:source ~/dotfiles/solarized-light.vim\n'
  else
    echo "NO background"
  fi
done

# exit 0
