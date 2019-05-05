#!/bin/sh
export DOTFILE_PWD=$(pwd)

# --- installation
sudo pacman -S neovim zsh nodejs tmux
sudo npm i -g typescript neovim

# todo: install py2/3 pip
python2 -m pip install neovim
python3 -m pip install neovim

# --- structure
mkdir $HOME/source
mkdir $HOME/binary
mkdir $HOME/projects

# todo: install pyenv

# --- tcc
chmod +x ./tcc/install.sh
./tcc/install.sh

# --- zsh
chmod +x ./zsh/install.sh
./zsh/install.sh

# --- neovim
chmod +x ./nvim/install.sh
./nvim/install.sh

# --- tmux
chmod +x ./tmux/install.sh
./tmux/install.sh

# --- dwm
chmod +x ./dwm/install.sh
./dwm/install.sh

# --- st
chmod +x ./st/install.sh
./st/install.sh

# --- dmenu
chmod +x ./dmenu/install.sh
./dmenu/install.sh

