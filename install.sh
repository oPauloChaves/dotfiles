#!/bin/bash

MY_PATH=`dirname "$0"`
MY_PATH=`( cd "$MY_PATH" && pwd )`

if [ -z "$MY_PATH" ] ; then
  exit 1
fi

# ZSH
# sh $MY_PATH/config-zsh.sh

# VIM
# [ -f ~/.vimrc ] && [ ! -f ~/.old-vimrc ] && mv ~/.vimrc ~/.old-vimrc
# [ -d ~/.vim ] && [ ! -d ~/.old-vim ] && mv ~/.vim ~/.old-nvim
# [ ! -L ~/.vimrc ] && ln -s "$(pwd)/vimrc" ~/.vimrc
# [ ! -L ~/.vim ] && ln -s "$MY_PATH/vim" ~/.vim

# TMUX
[ -f ~/.tmux.conf ] && [ ! -f ~/.old-tmux.conf ] && mv ~/.tmux.conf ~/.old-tmux.conf
[ ! -L ~/.tmux.conf ] && ln -s "$MY_PATH/tmux/tmux.conf" ~/.tmux.conf
