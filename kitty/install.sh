#!/bin/sh

sudo pacman -S kitty
ln -s -f $DOTFILE_PWD/kitty/kitty.conf $HOME/.config/kitty/kitty.conf
