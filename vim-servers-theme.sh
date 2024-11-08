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

if [ $scheme == "dark" ]; then
    nvim --server ~/.cache/nvim/server.pipe --remote-send $'\e:source ~/dotfiles/solarized-dark.vim\n'
elif [ $scheme == "light" ]; then
    nvim --server ~/.cache/nvim/server.pipe --remote-send $'\e:source ~/dotfiles/solarized-light.vim\n'
else 
    echo "NO background"
fi

# exit 0 
