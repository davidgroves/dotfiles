#!/usr/bin/env bash

DIR=~/dotfiles
BACKDIR=~/dotfiles_old

# Create backups of old dotfiles
mkdir -p $BACKDIR

# Install
cd $DIR

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for FILE in .*; do
    echo "Backing up $FILE"
    mv ~/.$FILE $BACKDIR
    echo "Creating symlink to $FILE in $HOME"
    ln -s $dir/$file ~/$file
done
