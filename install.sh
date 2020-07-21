#!/bin/sh
export DOTFILE_PWD=$(pwd)

# --- installation

sudo pacman -S git xclip ripgrep docker tig

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

# --- kitty
chmod +x ./kitty/install.sh
./kitty/install.sh

