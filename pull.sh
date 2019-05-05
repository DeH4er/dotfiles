#!/bin/sh
git pull

cd $HOME/source/dmenu
git pull
sudo make clean install

cd $HOME/source/st
git pull
sudo make clean install

cd $HOME/source/dwm
git pull
sudo make clean install
