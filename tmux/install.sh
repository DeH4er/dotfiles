#!/bin/sh
ln -s -f $DOTFILE_PWD/tmux/.tmux.conf $HOME/.tmux.conf

git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
#tmux source $HOME/.tmux.conf

echo "REMEMBER TO PRESS MOD+I IN TMUX TO LOAD PLUGINS"
