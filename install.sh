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

ln -s ~/.config/dotfiles/.bash_aliases ~/.bash_aliases
ln -s ~/.config/dotfiles/.bashrc ~/.bashrc
ln -s ~/.config/dotfiles/.fzf.bash ~/.fzf.bash
ln -s ~/.config/dotfiles/.profile ~/.profile
ln -s ~/.config/dotfiles/.tern-config ~/.tern-config
ln -s ~/.config/dotfiles/init.vim ~/.config/nvim/init.vim

