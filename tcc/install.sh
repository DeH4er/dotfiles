#!/bin/sh
git clone git://repo.or.cz/tinycc.git $HOME/source
cd $HOME/source/tinycc
./configure
make
make test
sudo make install
cd $DOTFILE_PWD
