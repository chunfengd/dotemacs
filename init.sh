#!/bin/bash

# backup old files if exist
if [ -e $HOME/.emacs ]; then
    echo "backup ~/.emacs"
    mv -f $HOME/.emacs $HOME/.emacs.old
fi
if [ -e $HOME/.emacs.d/init ]; then
    echo "backup ~/.emacs.d/init"
    mv -f $HOME/.emacs.d/init $HOME/.emacs.d/init.old
fi

# remove old link
if [ -h $HOME/.emacs ]; then
    echo "remove link ~/.emacs"
    rm -f $HOME/.emacs
fi
if [ -h $HOME/.emacs.d/init ]; then
    echo "remove link ~/.emacs.d/init"
    rm -f $HOME/.emacs.d/init
fi

# check dir
if [ ! -d $HOME/.emacs.d ]; then
    echo "create ~/.emacs.d"
    mkdir $HOME/.emacs.d
fi

# link files
echo "link files"
ln -s $PWD/.emacs $HOME/.emacs
ln -s $PWD/.emacs.d/init $HOME/.emacs.d/init

