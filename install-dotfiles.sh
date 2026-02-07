#!/usr/bin/env bash

SOURCEDIR=${PWD}/dotfiles
BACKDIR=~/.dotfiles_old

# Make backup dir if needed
echo Creating backup directory at $BACKDIR
mkdir -p $BACKDIR

# backup dotfiles
for FILE in $(
  cd $SOURCEDIR
  echo *
); do
  echo "Backing up ~/.$FILE to $BACKDIR/$FILE"
  mv ~/.$FILE $BACKDIR/$FILE
done

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for FILE in $(
  cd $SOURCEDIR
  echo *
); do
  echo "Creating symlink to $SOURCEDIR/.$FILE in $HOME"
  ln -sf $SOURCEDIR/$FILE ~/.$FILE
done

# Backup the ssh config
mkdir -p $BACKDIR/ssh
cp ~/.ssh/config $BACKDIR/ssh/config

# Setup SSH sockets dir
mkdir -p ~/.ssh/sockets
chmod 700 ~/.ssh/sockets

# create a file for neovim
echo "Setting up nvim config"
mkdir -p ~/.config/nvim
cp -r config/nvim/* ~/.config/nvim

echo "Setting up protobuff profiles"
rm -r ~/.config/protobuffs
mkdir -p ~/.config/protobuffs
cp -r config/protobuffs/* ~/.config/protobuffs

echo "Setting up neomutt"
mkdir -p ~/.config/neomutt/
cp -r config/neomutt/* ~/.config/neomutt

echo "Setting up SSH config"
mkdir -p ~/.ssh/
cp ssh/config ~/.ssh/config

echo "Setting up .local/bin/env"
mkdir -p ¬/.local/bin
touch ~/.local/bin/env



