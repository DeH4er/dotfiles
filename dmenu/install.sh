#!/bin/sh
git clone https://github.com/deh4er/dmenu $HOME/source/dmenu
cd $HOME/source/dmenu
sudo make clean install
cd $DOTFILE_PWD
