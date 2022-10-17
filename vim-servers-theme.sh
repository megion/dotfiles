#!/bin/bash
############################
# start vim as server:
#
# vimx --servername myvim-server
#
############################


scheme=${1}

# source ${HOME}/dotfiles/fzf_default_opts.sh $scheme
# gen_fzf_default_opts
# echo "Return value of the function is $FZF_DEFAULT_OPTS"
# echo "getval=${gen_fzf_default_opts}"
# mycom=""

for instance in $(vim --serverlist); do
    #echo "set background=$scheme for '$instance'"
    if [ $scheme == "dark" ]; then
        vim --servername $instance --remote-send $'\e:set background=dark\n'
        vim --servername $instance --remote-send $'\e:let $BAT_THEME="Solarized (dark)"\n'
        vim --servername $instance --remote-send $'\e:let $FZF_DEFAULT_OPTS="--color fg:-1,bg:-1,hl:33,fg+:254,bg+:235,hl+:33 --color info:136,prompt:136,pointer:230,marker:230,spinner:136"\n'
    elif [ $scheme == "light" ]; then
        vim --servername $instance --remote-send $'\e:set background=light\n'
        vim --servername $instance --remote-send $'\e:let $BAT_THEME="Solarized (light)"\n'
        vim --servername $instance --remote-send $'\e:let $FZF_DEFAULT_OPTS="--color fg:-1,bg:-1,hl:33,fg+:235,bg+:254,hl+:33 --color info:136,prompt:136,pointer:234,marker:234,spinner:136"\n'
    else 
        echo "NO background"
    fi

done
