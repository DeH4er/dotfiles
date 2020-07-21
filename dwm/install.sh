#!/bin/sh

git clone https://github.com/deh4er/dwm $HOME/source/dwm
cd $HOME/source/dwm
sudo make clean install
cd $DOTFILE_PWD

ln -s -f $DOTFILE_PWD/dwm/.xinitrc $HOME/.xinitrc
ln -s -f $DOTFILE_PWD/dwm/.Xresources $HOME/.Xresources

mkdir -p $HOME/.dwm

ln -s -f $DOTFILE_PWD/dwm/autostart_blocking.sh $HOME/.dwm/autostart_blocking.sh
ln -s -f $DOTFILE_PWD/dwm/autostart.sh $HOME/.dwm/autostart.sh
