#!/bin/bash

# see https://github.com/junegunn/fzf/wiki/Color-schemes

scheme=${1}
# scheme=dark

gen_fzf_default_opts() {
  local base03="234"
  local base02="235"
  local base01="240"
  local base00="241"
  local base0="244"
  local base1="245"
  local base2="254"
  local base3="230"
  local yellow="136"
  local orange="166"
  local red="160"
  local magenta="125"
  local violet="61"
  local blue="33"
  local cyan="37"
  local green="64"
  # Uncomment for truecolor, if your terminal supports it.
  # local base03="#002b36"
  # local base02="#073642"
  # local base01="#586e75"
  # local base00="#657b83"
  # local base0="#839496"
  # local base1="#93a1a1"
  # local base2="#eee8d5"
  # local base3="#fdf6e3"
  # local yellow="#b58900"
  # local orange="#cb4b16"
  # local red="#dc322f"
  # local magenta="#d33682"
  # local violet="#6c71c4"
  # local blue="#268bd2"
  # local cyan="#2aa198"
  # local green="#859900"

  # Comment and uncomment below for the light theme.

  if [ $scheme == "light" ]; then
      ## Solarized Light color scheme for fzf
      export FZF_DEFAULT_OPTS="
      --color fg:-1,bg:-1,hl:$blue,fg+:$base02,bg+:$base2,hl+:$blue
      --color info:$yellow,prompt:$yellow,pointer:$base03,marker:$base03,spinner:$yellow
      "
      # export FZF_DEFAULT_OPTS="
      # --color fg:240,bg:230,hl:33,fg+:241,bg+:221,hl+:33
      # --color info:33,prompt:33,pointer:166,marker:166,spinner:33
      # "
  else 
      # Solarized Dark color scheme for fzf
      export FZF_DEFAULT_OPTS="
      --color fg:-1,bg:-1,hl:$blue,fg+:$base2,bg+:$base02,hl+:$blue
      --color info:$yellow,prompt:$yellow,pointer:$base3,marker:$base3,spinner:$yellow
      "
      # export FZF_DEFAULT_OPTS="
      # --color dark,hl:33,hl+:37,fg+:235,bg+:136,fg+:254
      # --color info:254,prompt:37,spinner:108,pointer:235,marker:235
      # "
  fi
  
  export BAT_THEME="Solarized ($scheme)"
  echo $FZF_DEFAULT_OPTS
}
gen_fzf_default_opts
