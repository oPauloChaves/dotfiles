# Paulo Chaves - Dotfiles

### Install

### TODO

- [ ] Write a meaningful README
  - [ ] Add requirements and how to install it
  - [ ] Brief description about each plugin used with neovim
  - [ ] List all alias and where they can be defined
- [ ] Create a better installation script that work on Ubuntu and WSL


-----------------------

- tmux
- neovim

  - Install coc extensions with

    ```bash
    vim -c 'CocInstall -sync coc-snippets coc-pairs coc-tsserver coc-eslint coc-prettier coc-json coc-emmet coc-java|q'
    ```

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
