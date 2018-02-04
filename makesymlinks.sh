#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired
# dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
bin_dir=~/bin                     # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="vimrc tmux.conf bashrc"    # list of files/folders to symlink in homedir
#bin_files="diffconflicts.sh"    

##########

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# create bin_dir in homedir
echo -n "Creating $bin_dir in ~ ..."
mkdir -p $bin_dir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory,
# then create symlinks from the homedir to any files in the 
# ~/dotfiles directory specified in $files
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

#for file in $bin_files; do
    #echo "Creating symlink to $file in home bin directory."
    #ln -s $dir/$file $bin_dir/$file
#done


