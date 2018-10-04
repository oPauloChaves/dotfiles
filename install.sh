#!/bin/bash

if [ -f "$HOME/.bashrc" ]; then
  mv "$HOME/.bashrc" "$HOME/.old-bashrc"
fi

if [ -f "$HOME/.zshrc" ]; then
  mv "$HOME/.zshrc" "$HOME/.old-zshrc"
fi

if [ -f "$HOME/.profile" ]; then
  mv "$HOME/.profile" "$HOME/.old-profile"
fi

if [ -f "$HOME/.tern-config" ]; then
  mv "$HOME/.tern-config" "$HOME/.old-tern-config"
fi

if [ -f "$HOME/.tmux.conf" ]; then
  mv "$HOME/.tmux.conf" "$HOME/.old-tmux.conf"
fi

if [ -f "$HOME/.inputrc" ]; then
  mv "$HOME/.inputrc" "$HOME/.old-inputrc"
fi

if [ ! -s "$HOME/.config/nvim" ]; then
  mkdir "$HOME/.config/nvim"
else
  [[ -s "$HOME/.config/nvim/init.vim" ]] && mv "$HOME/.config/nvim/init.vim" "$HOME/.config/nvim/old-init.vim"
fi

ln -s "$HOME/code/dotfiles/.bashrc" "$HOME/.bashrc"
ln -s "$HOME/code/dotfiles/.zshrc" "$HOME/.zshrc"
# ln -s "$HOME/dotfiles/.profile" "$HOME/.profile"
ln -s "$HOME/code/dotfiles/.inputrc" "$HOME/.inputrc"
ln -s "$HOME/code/dotfiles/.tern-config" "$HOME/.tern-config"

ln -s "$HOME/code/dotfiles/nvim/init.vim" "$HOME/.config/nvim/init.vim"
ln -s "$HOME/code/dotfiles/nvim/autoload" "$HOME/.config/nvim/autoload"
ln -s "$HOME/code/dotfiles/nvim/plugged" "$HOME/.config/nvim/plugged"
ln -s "$HOME/code/dotfiles/nvim/colors" "$HOME/.config/nvim/colors"
ln -s "$HOME/code/dotfiles/nvim/ftdetect" "$HOME/.config/nvim/ftdetect"
ln -s "$HOME/code/dotfiles/nvim/UltiSnips" "$HOME/.config/nvim/UltiSnips"

ln -s "$HOME/code/dotfiles/tmux/tmux.conf" "$HOME/.tmux.conf"

echo "Setup done"
