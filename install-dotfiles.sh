#!/usr/bin/env bash

DIR=~/dotfiles
BACKDIR=~/dotfiles_old
FILES="bashrc curlrc gitconfig inputrc osx psqlrc screenrc vimrc"

# Create backups of old dotfiles
mkdir -p $BACKDIR

# Install
cd $DIR

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for FILE in $FILES; do
    echo "Backing up $FILE"
    mv ~/.$FILE $BACKDIR
    echo "Creating symlink to $FILE in $HOME"
    ln -s $DIR/ ~/.$FILE
done
