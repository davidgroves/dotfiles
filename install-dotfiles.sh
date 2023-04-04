#!/usr/bin/env bash

SOURCEDIR=~/dotfiles/dotfiles
BACKDIR=~/.dotfiles_old

# Make backup dir if needed
echo Creating backup directory at $BACKDIR
mkdir -p $BACKDIR

# backup dotfiles
for FILE in `cd $SOURCEDIR; echo *`; do
    echo "Backing up ~/.$FILE to $BACKDIR/$FILE"
    mv ~/.$FILE $BACKDIR/$FILE
done

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for FILE in `cd $SOURCEDIR; echo *`; do
    echo "Creating symlink to $SOURCEDIR/.$FILE in $HOME"
    ln -sf $SOURCEDIR/$FILE ~/.$FILE
done
