#!/bin/bash
############################
# utilites for edit svn conflicts
# 
# set property:
# merge-tool-cmd = /home/ilya/dotfiles/svn_merger.sh
# in file ~/.subversion/config
############################

########## Variables

BASE=${1}
THEIRS=${2}
MINE=${3}
MERGED=${4}
WCPATH=${5}

##########
echo BASE: $BASE
echo THEIRS: $THEIRS
echo MINE: $MINE
echo MERGED: $MERGED
echo WCPATH: $WCPATH

vimdiff $MINE $THEIRS -c ":bo sp $MERGED" -c ":diffthis" -c "setl stl=MERGED%20{'$MERGED'} | wincmd W | setl stl=THEIRS%20{'$THEIRS'} | wincmd W | setl stl=MINE%20{'$MINE}"
