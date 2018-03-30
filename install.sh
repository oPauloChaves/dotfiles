#!/bin/bash

[[ -s "$HOME/.bash_aliases" ]] && mv "$HOME/.bash_aliases" "$HOME/.old-bash_aliases"
[[ -s "$HOME/.bashrc" ]] && mv "$HOME/.bashrc" "$HOME/.old-bashrc"
[[ -s "$HOME/.zshrc" ]] && mv "$HOME/.zshrc" "$HOME/.old-zshrc"
[[ -s "$HOME/.fzf.bash" ]] && mv "$HOME/.fzf.bash" "$HOME/.old-fzf.bash"
[[ -s "$HOME/.fzf.zsh" ]] && mv "$HOME/.fzf.zsh" "$HOME/.old-fzf.zsh"
[[ -s "$HOME/.profile" ]] && mv "$HOME/.profile" "$HOME/.old-profile"
[[ -s "$HOME/.tern-config" ]] && mv "$HOME/.tern-config" "$HOME/.old-tern-config"
[[ -s "$HOME/.tmux.conf" ]] && mv "$HOME/.tmux.conf" "$HOME/.old-tmux.conf"
[[ -s "$HOME/.inputrc" ]] && mv "$HOME/.inputrc" "$HOME/.old-inputrc"

if [ ! -s "$HOME/.config/nvim" ]; then
    mkdir "$HOME/.config/nvim"
else
    [[ -s "$HOME/.config/nvim/init.vim" ]] && mv "$HOME/.config/nvim/init.vim" "$HOME/.config/nvim/old-init.vim"
fi

ln -s "$HOME/dotfiles/.bash_aliases" "$HOME/.bash_aliases"
ln -s "$HOME/dotfiles/.bashrc" "$HOME/.bashrc"
ln -s "$HOME/dotfiles/.zshrc" "$HOME/.zshrc"
ln -s "$HOME/dotfiles/.fzf.bash" "$HOME/.fzf.bash"
ln -s "$HOME/dotfiles/.fzf.zsh" "$HOME/.fzf.zsh"
ln -s "$HOME/dotfiles/.profile" "$HOME/.profile"
ln -s "$HOME/dotfiles/.inputrc" "$HOME/.inputrc"
ln -s "$HOME/dotfiles/.tern-config" "$HOME/.tern-config"

ln -s "$HOME/dotfiles/nvim/init.vim" "$HOME/.config/nvim/init.vim"
ln -s "$HOME/dotfiles/nvim/autoload" "$HOME/.config/nvim/autoload"
ln -s "$HOME/dotfiles/nvim/plugged" "$HOME/.config/nvim/plugged"
ln -s "$HOME/dotfiles/nvim/ftdetect" "$HOME/.config/nvim/ftdetect"
ln -s "$HOME/dotfiles/nvim/UltiSnips" "$HOME/.config/nvim/UltiSnips"

ln -s "$HOME/dotfiles/tmux/tmux.conf" "$HOME/.tmux.conf"

echo "Setup done"
