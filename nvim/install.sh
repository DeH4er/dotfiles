#!/bin/sh
mkdir -p $HOME/.config/nvim
ln -s -f $DOTFILE_PWD/nvim/init.vim $HOME/.config/nvim/init.vim
ln -s -f $DOTFILE_PWD/nvim/UltiSnips $HOME/.config/nvim/UltiSnips
ln -s -f $DOTFILE_PWD/nvim/coc-settings.json $HOME/.config/nvim/coc-settings.json

mkdir -p $HOME/.cache/dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > dein_installer.sh 

chmod +x dein_installer.sh
$DOTFILE_PWD/dein_installer.sh $HOME/.cache/dein

echo "call dein#install() | UpdateRemotePlugins | quit" | vim -e
