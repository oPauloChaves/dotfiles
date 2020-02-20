#!/bin/bash

MY_PATH=`dirname "$0"`
MY_PATH=`( cd "$MY_PATH" && pwd )`

if [ -z "$MY_PATH" ] ; then
  exit 1
fi

# ZSH
sh $MY_PATH/config-zsh.sh

# Neovim
[ -d ~/.config/nvim ] && [ ! -d ~/.config/old-nvim ] && mv ~/.config/nvim ~/.config/old-nvim
[ ! -L ~/.config/nvim ] && ln -s "$(pwd)/nvim" ~/.config/nvim

# TMUX
[ -f ~/.tmux.conf ] && [ ! -f ~/.old-tmux.conf ] && mv ~/.tmux.conf ~/.old-tmux.conf
[ ! -L ~/.tmux.conf ] && ln -s "$MY_PATH/tmux/tmux.conf" ~/.tmux.conf

[ -f ~/.bashrc ] && [ ! -f ~/.old-bashrc ] && mv ~/.bashrc ~/.old-bashrc
[ ! -L ~/.bashrc ] && ln -s "$MY_PATH/.bashrc" ~/.bashrc

echo "Done!"
