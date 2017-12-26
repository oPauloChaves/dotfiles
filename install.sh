cd ~
rm -f .bash_aliases
rm -f .bashrc
rm -f .fzf.bash
rm -f .profile
rm -f .tern-config

if [ -d "$HOME/.config/nvim" ] ; then
	rm -rf "$HOME/.config/nvim"
	mkdir "$HOME/.config/nvim"
fi

# create backup of current files

ln -s "$HOME/dotfiles/.bash_aliases" "$HOME/.bash_aliases"
ln -s "$HOME/dotfiles/.bashrc" "$HOME/.bashrc"
ln -s "$HOME/dotfiles/.fzf.bash" "$HOME/.fzf.bash"
ln -s "$HOME/dotfiles/.profile" "$HOME/.profile"
ln -s "$HOME/dotfiles/.tern-config" "$HOME/.tern-config"
ln -s "$HOME/dotfiles/init.vim" "$HOME/.config/nvim/init.vim"
ln -s "$HOME/dotfiles/tmux/tmux.conf" "$HOME/.tmux.conf"
