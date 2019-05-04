#!/bin/sh
export DOTFILE_PWD=$(pwd)

# --- installation
sudo pacman -S neovim zsh nodejs tmux
sudo npm i -g typescript neovim

# todo: install py2/3 pip
python2 -m pip install neovim
python3 -m pip install neovim

# todo: install pyenv

# todo: install tcc
# todo: install st
# todo: install dwm
# todo: install dmenu

# --- zsh
chmod +x ./zsh/install.sh
./zsh/install.sh

# --- neovim
chmod +x ./nvim/install.sh
./nvim/install.sh

# --- tmux
chmod +x ./tmux/install.sh
./tmux/install.sh

# --- structure
mkdir $HOME/source
mkdir $HOME/binary
mkdir $HOME/projects
