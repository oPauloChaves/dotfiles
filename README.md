Copy this to ~/.config/dotfiles

Most config is from here: https://github.com/nicknisi/dotfiles

### Install

- tmux
- neovim
  - [YouCompleteMe on Fedora](https://github.com/Valloric/YouCompleteMe#fedora-linux-x64)
- pip, pip3
- neovim (for pip and pip3)
- zsh
- oh-my-zsh
- cmake
- [silver search](https://github.com/ggreer/the_silver_searcher)
- [fd](https://github.com/sharkdp/fd)
- fzf
- nvm
- rvm


### Then run:

```sh
$ cd ~/.config/dotfiles && sh install.sh
```

### Tmux plugins

```sh
$ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# jump into tmux
$ tmux
# and PREFIX I
```

### Docker completion

```sh
mkdir -p ~/.oh-my-zsh/plugins/docker/
curl -fLo ~/.oh-my-zsh/plugins/docker/_docker https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker

# docker-compose - https://docs.docker.com/compose/completion/
$ mkdir -p ~/.zsh/completion
$ curl -L https://raw.githubusercontent.com/docker/compose/1.20.1/contrib/completion/zsh/_docker-compose > ~/.zsh/completion/_docker-compose
```

### zsh autosuggestions

```sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

Using a [plugin](https://github.com/robbyrussell/oh-my-zsh#using-oh-my-zsh) within oh-my-zsh

### Sublime Text

[linux repositories](https://www.sublimetext.com/docs/3/linux_repositories.html)


## TODO

- Automate installation
