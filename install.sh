#!/bin/bash

cd $HOME

if [ -f .bash_aliases ]; then
    mv .bash_aliases .old-bash_aliases
fi
if [ -f .bashrc ]; then
    mv .bashrc .old-bashrc
fi
# if [ -f .zshrc ]; then
#    mv .zshrc .old-zshrc
# fi
if [ -f .fzf.bash ]; then
    mv .fzf.bash .old-fzf.bash
fi
# if [ -f .fzf.zsh ]; then
#    mv .fzf.zsh .old-fzf.zsh
# fi
if [ -f .profile ]; then
    mv .profile .old-profile
fi
if [ -f .tern-config ]; then
    mv .tern-config .old-tern-config
fi
if [ -f .tmux.conf ]; then
    mv .tmux.conf .old-tmux.conf
fi
if [ -f .inputrc ]; then
    mv .inputrc .old-inputrc
fi
if [ -f .config/nvim/init.vim ] ; then
    mv .config/nvim/init.vim .config/nvim/old-init.vim
fi

ln -s "$HOME/dotfiles/.bash_aliases" "$HOME/.bash_aliases"
ln -s "$HOME/dotfiles/.bashrc" "$HOME/.bashrc"
# ln -s "$HOME/dotfiles/.zshrc" "$HOME/.zshrc"
ln -s "$HOME/dotfiles/.fzf.bash" "$HOME/.fzf.bash"
# ln -s "$HOME/dotfiles/.fzf.zsh" "$HOME/.fzf.zsh"
ln -s "$HOME/dotfiles/.profile" "$HOME/.profile"
ln -s "$HOME/dotfiles/.inputrc" "$HOME/.inputrc"
ln -s "$HOME/dotfiles/.tern-config" "$HOME/.tern-config"
ln -s "$HOME/dotfiles/init.vim" "$HOME/.config/nvim/init.vim"
ln -s "$HOME/dotfiles/tmux/tmux.conf" "$HOME/.tmux.conf"

echo "Setup done"
