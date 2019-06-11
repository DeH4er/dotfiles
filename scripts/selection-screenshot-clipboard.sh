#!/bin/sh

cd $HOME/screenshots
scrot -s -e 'xclip -selection clipboard -target image/png -i $f && rm $f'
