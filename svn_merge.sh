#!/bin/bash
############################
# utilites for edit svn conflicts
# 
# set property:
# merge-tool-cmd = /home/ilya/dotfiles/svn_merge.sh
# in file ~/.subversion/config
############################

########## Variables

BASE=${1}
THEIRS=${2}
MINE=${3}
MERGED=${4}
WCPATH=${5}

BASE_TITLE=${BASE}-BASE
THEIRS_TITLE=${THEIRS}-THEIRS
MINE_TITLE=${MINE}-MINE
MERGED_TITLE=${MERGED}-MERGED

##########
echo BASE: $BASE
echo THEIRS: $THEIRS
echo MINE: $MINE
echo MERGED: $MERGED
echo WCPATH: $WCPATH

# vimx -d -> vimdiff for support X11
vimx -d $MINE $BASE $THEIRS -c ":bo sp $MERGED" -c ":diffthis" -c \
    "let &l:stl = '${MERGED_TITLE}' \
    | wincmd W | let &l:stl = '${THEIRS_TITLE}' \
    | wincmd W | let &l:stl = '${BASE_TITLE}' \
    | wincmd W | let &l:stl = '${MINE_TITLE}' | wincmd W"
