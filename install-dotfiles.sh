#!/usr/bin/env bash

SOURCEDIR=~/dotfiles/dotfiles
BACKDIR=~/.dotfiles_old

# Make backup dir if needed
mkdir -p ~/$BACKDIR

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for FILE in `cd $SOURCEDIR; echo *`; do
    echo $FILE
    echo "Backing up $SOURCEDIR/$FILE to $BACKDIR/$FILE"
    mv $SOURCEDIR/$FILE $BACKDIR/$FILE
    echo "Creating symlink to dotfiles/$SOURCEDIR/.$FILE in $HOME"
    ln -sf dotfiles/$SOURCEDIR/$FILE ~/.$FILE
done
