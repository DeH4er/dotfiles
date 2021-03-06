#!/bin/sh
export DOTFILE_PWD=$(pwd)

sudo pacman -S xclip ripgrep tig scrot python3 ttf-hack zsh neovim kitty xorg-xinit xorg xorg-server

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

# pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py
rm get-pip.py

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install v12.18.2

# fonts
yay -S ttf-jetbrains-mono-git

# pyenv
curl https://pyenv.run | bash
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
pyenv install 3.8.4
pyenv virtualenv 3.8.4 nvim
pyenv activate nvim
pip install pynvim
pip install neovim
pyenv --unset

cd $DOTFILE_PWD

./zsh/install.sh
./nvim/install.sh
./dwm/install.sh
./dmenu/install.sh
./kitty/install.sh
./slstatus/install.sh

cat README
