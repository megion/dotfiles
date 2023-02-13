#!/bin/bash
############################
# start vim as server:
#
# vimx --servername myvim-server
#
############################


scheme=${1}

for instance in $(nvr --serverlist); do
    # echo "set background=$scheme for '$instance'"
    if [ $scheme == "dark" ]; then
        nvr --servername $instance --remote-send $'\e:source ~/dotfiles/solarized-dark.vim\n'
    elif [ $scheme == "light" ]; then
        nvr --servername $instance --remote-send $'\e:source ~/dotfiles/solarized-light.vim\n'
    else 
        echo "NO background"
    fi
done

# exit 0 
