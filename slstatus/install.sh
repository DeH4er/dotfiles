#!/bin/sh

git clone https://github.com/deh4er/slstatus $HOME/source/slstatus
cd $HOME/source/slstatus
git checkout my
sudo make clean install
cd $DOTFILE_PWD
