#!/bin/bash
############################
# start vim as server:
#
# vimx --servername myvim-server
#
############################


scheme=${1}

for instance in $(vim --serverlist); do
    #echo "set background=$scheme for '$instance'"
    if [ $scheme == "dark" ]; then
        vim --servername $instance --remote-send $'\e:set background=dark\n'
    elif [ $scheme == "light" ]; then
        vim --servername $instance --remote-send $'\e:set background=light\n'
    else 
        echo "NO background"
    fi
done
