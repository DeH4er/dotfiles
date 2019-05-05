#!/bin/sh
git clone git@github.com:DeH4er/dwm.git $HOME/source
cd $HOME/source/dwm
sudo make clean install
cd $DOTFILE_PWD
