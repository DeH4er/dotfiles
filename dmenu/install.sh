#!/bin/sh
git clone https://github.com/deh4er/dmenu $HOME/source/dmenu
cd $HOME/source/dmenu
git checkout my
sudo make clean install
cd $DOTFILE_PWD
