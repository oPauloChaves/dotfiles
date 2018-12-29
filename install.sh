#!/bin/bash

[ -f ~/.bashrc ] && [ ! -f ~/.old-bashrc ] && mv ~/.bashrc ~/.old-bashrc
[ -f ~/.zshrc ] && [ ! -f ~/.old-zshrc ] && mv ~/.zshrc ~/.old-zshrc
[ -f ~/.profile ] && [ ! -f ~/.old-profile ] && mv ~/.profile ~/.old-profile
[ -f ~/.tern-config ] && [ ! -f ~/.old-tern-config ] && mv ~/.tern-config ~/.old-tern-config
[ -f ~/.tmux.conf ] && [ ! -f ~/.old-tmux.conf ] && mv ~/.tmux.conf ~/.old-tmux.conf
[ -f ~/.inputrc ] && [ ! -f ~/.old-inputrc ] && mv ~/.inputrc ~/.old-inputrc
[ -d ~/.config/nvim ] && [ ! -d ~/.config/old-nvim ] && mv ~/.config/nvim ~/.config/old-nvim

[ -d ~/.zsh.d ] || mkdir ~/.zsh.d

for file in zsh/*; do
  [ -L ~/.zsh.d/$(basename $file) ] || ln -s "$(pwd)/$file" ~/.zsh.d/$(basename $file)
done

[ ! -L ~/.zshrc ] && ln -s "$(pwd)/.zshrc" ~/.zshrc
[ ! -L ~/.bashrc ] && ln -s "$(pwd)/.bashrc" ~/.bashrc
[ ! -L ~/.profile ] && ln -s "$(pwd)/.profile" ~/.profile
[ ! -L ~/.inputrc ] && ln -s "$(pwd)/.inputrc" ~/.inputrc
[ ! -L ~/.tern-config ] && ln -s "$(pwd)/.tern-config" ~/.tern-config
[ ! -L ~/.config/nvim ] && ln -s "$(pwd)/nvim" ~/.config/nvim
[ ! -L ~/.tmux.conf ] && ln -s "$(pwd)/tmux/tmux.conf" ~/.tmux.conf

echo "Setup done"
