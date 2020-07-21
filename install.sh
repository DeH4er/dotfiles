#!/bin/sh
export DOTFILE_PWD=$(pwd)

sudo pacman -S xclip ripgrep docker tig

./git/install.sh

# --- structure
mkdir -p $HOME/source
mkdir -p $HOME/binary
mkdir -p $HOME/projects

# --- tools from source
cd $HOME/source

# yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..

# autojump
git clone git://github.com/wting/autojump.git
cd autojump
./install.py
cd ..

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
nvm install v12.18.2

# fonts
sudo pacman -S ttf-hack
yay -S ttf-jetbrains-mono-git

# pyenv
curl https://pyenv.run | bash

cd $DOTFILE_PWD

./zsh/install.sh
./nvim/install.sh
./dwm/install.sh
./dmenu/install.sh
./kitty/install.sh
./slstatus/install.sh
# TODO: add git config and installation
