#!/bin/bash

BASE=${1}
LOCAL=${2}
REMOTE=${3}
MERGED=${4}

echo BASE: $BASE
echo LOCAL: $LOCAL
echo REMOTE: $REMOTE
echo MERGED: $MERGED

echo ALL: $*

BASE_TITLE=${BASE}
LOCAL_TITLE=${LOCAL}
REMOTE_TITLE=${REMOTE}
MERGED_TITLE=${MERGED}

# vimx -d -> vimdiff for support X11
vimxs -d $LOCAL $BASE $REMOTE -c ":bo sp $MERGED" -c ":diffthis" -c \
    "let &l:stl = '${MERGED_TITLE}' \
    | wincmd W | let &l:stl = '${REMOTE_TITLE}' \
    | wincmd W | let &l:stl = '${BASE_TITLE}' \
    | wincmd W | let &l:stl = '${LOCAL_TITLE}' | wincmd W"
