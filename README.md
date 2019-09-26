Dotfiles
========
This repository includes all of my custom dotfiles.  They should be cloned to
your home directory so that the path is `~/dotfiles/`.  The included setup
script creates symlinks from your home directory to the files which are located
in `~/dotfiles/`.

The setup script is smart enough to back up your existing dotfiles into a
`~/dotfiles_old/` directory if you already have any dotfiles of the same name as
the dotfile symlinks being created in your home directory.

Installation
------------

``` bash
git clone git://github.com/megion/dotfiles ~/dotfiles
cd ~/dotfiles
./makesymlinks.sh
```

Configure tmux
--------------

``` bash
# tmux settings see https://github.com/tmux-plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# rum tmux and type `prefix + I` to install plugins
```

Configure solarized color
-------------------------

``` bash
mkdir ~/workspaces/configs
cd ~/workspaces/configs

# 1. Gnome termial initial steps:
git clone https://github.com/Anthony25/gnome-terminal-colors-solarized.git 
# create gnome terminal profile `my_solarized`

# 2. Mintty termial initial steps:
git clone https://github.com/megion/mintty-colors-solarized.git 
git clone https://github.com/seebi/dircolors-solarized.git

# Changing color sheme in mintty terminal works only by command:
~/dotfiles/set-solarized-terminal-theme.sh dark<light>


# Unfortunately run `prefix + I` into tmux is not worked now for mintty.
```
