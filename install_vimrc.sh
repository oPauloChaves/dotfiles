#!/bin/sh
set -e

MY_PATH=`dirname "$0"`
MY_PATH=`( cd "$MY_PATH" && pwd )`

if [ -z "$MY_PATH" ] ; then
  exit 1
fi

[ -f ~/.vimrc ] && [ ! -f ~/.old-vimrc ] && mv ~/.vimrc ~/.old-vimrc
[ ! -L ~/.vimrc ] && ln -s "$MY_PATH/vimrc" ~/.vimrc

# Vim
[ -d ~/.vim ] && [ ! -d ~/.old-vim ] && mv ~/.vim ~/.old-nvim
[ ! -L ~/.vim ] && ln -s "$(pwd)/vim" ~/.vim

echo "Vim configuration installed with success! :-)"
