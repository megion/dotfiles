#!/bin/bash
############################
# This script creates symlinks from the home directory to any desired
# dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
bindir=~/bin                      # bin directory
svnConfigDir=~/.subversion/config # svn config directory
files="vimrc tmux.conf bashrc ackrc gitignore" # list of files to symlink in homedir
svnConfigFile="svn_config"
cocSettingsFile="coc-settings.json"

autostartDir=~/.config/autostart
termialAutostartFile="terminal.desktop"

# git config --global merge.conflictstyle diff3
# git config --global merge.tool 'my-git-merge'
# git config --global mergetool.my-git-merge.cmd 'my-git-merge.sh "$BASE"\
# "$LOCAL" "$REMOTE" "$MERGED"'
# git config --global mergetool.trustExitCode false
# git config --global diff.external my-git-diff.sh

# add secure_path="......:/home/ilya/bin" by run sudo visudo
# for view this files by sudo
binFiles="my-git-diff.sh my-git-merge.sh vimxs" # list of executable files

##########

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

echo -n "Creating $bindir ..."
mkdir -p $bindir
echo "done"

echo -n "Creating $svnConfigDir ..."
mkdir -p $svnConfigDir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory,
# then create symlinks from the homedir to any files in the 
# ~/dotfiles directory specified in $files
for file in $files; do
    mv ~/.$file ~/dotfiles_old/
    ln -sv $dir/$file ~/.$file
done

# process svn config file
mv $svnConfigDir ~/dotfiles_old/$svnConfigFile 
ln -sv  $dir/$svnConfigFile $svnConfigDir

# process git files 
for file in $binFiles; do
    mv $bindir/$file ~/dotfiles_old/
    ln -sv $dir/$file $bindir/$file
done

# process cocSettingsFile
mkdir -p ~/.vim
ln -sfv $dir/$cocSettingsFile ~/.vim/$cocSettingsFile

# process autostart configs
ln -sfv  $dir/$termialAutostartFile $autostartDir

# process i3-wm config
mkdir -p ~/.config/i3
ln -sfv $dir/i3/config ~/.config/i3/config

# process polybar config
mkdir -p ~/.config/polybar
ln -sfv $dir/polybar/config.ini ~/.config/polybar/config.ini
ln -sfv $dir/polybar/launch.sh ~/.config/polybar/launch.sh

# process i3status config
mkdir -p ~/.config/i3status
ln -sfv $dir/i3status/config ~/.config/i3status/config

# process pulse audio config
mkdir -p ~/.config/pulse
ln -sfv $dir/pulse/client.conf ~/.config/pulse/client.conf
