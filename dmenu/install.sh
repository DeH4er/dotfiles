#!/bin/sh
git clone git@github.com:DeH4er/dmenu.git $HOME/source/dmenu
cd $HOME/source/dmenu
sudo make clean install
cd $DOTFILE_PWD
