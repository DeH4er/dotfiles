#!/bin/sh
export DOTFILE_PWD=$(pwd)

# --- installation
sudo pacman -S neovim zsh kitty
sudo npm i -g typescript neovim

# todo: install py2/3 pip
python2 -m pip install neovim
python3 -m pip install neovim

# --- structure
mkdir $HOME/source
mkdir $HOME/binary
mkdir $HOME/projects
# todo: install pyenv

# --- zsh
chmod +x ./zsh/install.sh
./zsh/install.sh

# --- neovim
chmod +x ./nvim/install.sh
./nvim/install.sh

# --- dwm
chmod +x ./dwm/install.sh
./dwm/install.sh

# --- dmenu
chmod +x ./dmenu/install.sh
./dmenu/install.sh

