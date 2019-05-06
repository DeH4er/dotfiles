#!/bin/sh
git clone git@github.com:DeH4er/st.git $HOME/source/st
cd $HOME/source/st
sudo make clean install
cd $DOTFILE_PWD
