#!/bin/sh

# oh my zsh
RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# chsh -s zsh
ln -s -f $DOTFILE_PWD/zsh/.zshrc $HOME/.zshrc
touch $HOME/.local_zshrc
