#!/bin/sh

cd $HOME/screenshots
scrot -u -e 'xclip -selection clipboard -target image/png -i $f && rm $f'
