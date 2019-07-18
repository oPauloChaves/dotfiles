# Installing package on Fedora 29

### update packages

```sh
sudo dnf update
```

### google chrome (download it first)

```sh
cd ~/Downloads
sudo dnf install ./google-chrome-stable_current_x86_64.rpm
```

### keepass

```sh
sudo dnf install keepass
```

### Adobe source code pro font

```sh
sudo dnf install adobe-source-code-pro-fonts-2.030.1.050-5.fc29.noarch
```

### Git

```sh
sudo dnf install git

# Generate a SSH key to avoid typing your password
# https://help.github.com/en/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

# Check your key permission to make sure it's readable/writable only by you in case you've copyied
chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa.pub

# Config
git config --global user.name 'Paulo Chaves'
git config --global user.email 'opaulochaves@gmail.com'
git config --global color.ui true
git config --global core.editor vim
```

# FZF

```sh
sudo dnf install fzf
# Shell completion and plugins for vim or neovim are enabled by default
```

# ripgrep

```sh
sudo dnf install ripgrep
```

# ZSH

```sh
sudo dnf install zsh

# Making zsh your default shell
chsh -s $(which zsh)

# Installing antibody (a shell plugin manager)
curl -sL git.io/antibody | sh -s

# Configuring
cd ~/Code/dotfiles
sh install.sh
```

### VIM

* [Matching Terminal and Vim colors automatically](https://browntreelabs.com/base-16-shell-and-why-its-so-awsome/)
* [Fixing issue base16-shell plugin with vim 8.1](https://github.com/chriskempson/base16-vim/issues/197#issuecomment-472710118)
* [Installing dependencies to build YCM](https://github.com/Valloric/YouCompleteMe#linux-64-bit)

```sh
# YCM dependencies
sudo dnf install cmake gcc-c++ make python3-devel

vim +PlugInstall +qa
vim +PlugUpdate +qa # update plugins
```

### Node.js + Yarn + build tools

```sh
sudo curl -sL https://rpm.nodesource.com/setup_11.x | bash -
sudo dnf install -y gcc-c++ make
sudo dnf install nodejs
curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
sudo dnf install yarn
```

[Resolving EACCES permissions errors when installing packages globally](https://docs.npmjs.com/resolving-eacces-permissions-errors-when-installing-packages-globallyo)

```sh
$ cd ~/.bashrc

NPM_CONFIG_PREFIX=~/.npm-global
PATH=~/.npm-global/bin:$PATH

export NPM_CONFIG_PREFIX
export PATH

$ source ~/.bashrc # or close and open terminal
```

### Docker

[Get Docker CE for Fedora](https://docs.docker.com/install/linux/docker-ce/fedora/)

```sh
sudo dnf -y install dnf-plugins-core

sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo

sudo dnf install docker-ce docker-ce-cli containerd.io
```

Post-installation steps for Linux

```sh
sudo groupadd docker
sudo usermod -aG docker $USER

# If docker is not running
sudo systemctl start docker

# Configure Docker to start on boot
sudo systemctl enable docker

# After configuring your user you need to log out or restart your computer

# Verify that you can run docker without sudo
docker run hello-world

# docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# apply executable permissions to the binary
sudo chmod +x /usr/local/bin/docker-compose
```

# Mailspring

```sh
cd ~/Downloads
chmod +x mailspring-1.6.1-0.1.x86_64.rpm
sudo dnf install ./mailspring-1.6.1-0.1.x86_64.rpm
```

# Slack

```sh
cd ~/Downloads
chmod +x slack-3.3.8-0.1.fc21.x86_64.rpm
sudo dnf install ./slack-3.3.8-0.1.fc21.x86_64.rpm
```

# Skype

```sh
cd ~/Downloads
chmod +x skypeforlinux-64.rpm
sudo dnf install ./skypeforlinux-64.rpm
```

# VS Code

```sh
cd ~/Downloads
chmod +x code-1.33.0-1554390950.el7.x86_64.rpm
sudo dnf install ./code-1.33.0-1554390950.el7.x86_64.rpm
```

# Mega Sync

```sh
cd ~/Downloads
chmod +x megasync-Fedora_29.x86_64.rpm
sudo dnf install ./megasync-Fedora_29.x86_64.rpm
```

# Gimp

```sh
sudo dnf install gimp
```

# Elixir

```sh
sudo dnf install elixir
```

# Tilix

```sh
sudo dnf isntall tilix
```

# Tmux

```sh
sudo dnf install tmux

# plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Press prefix + I (capital i, as in Install) to fetch the plugin.
```

# Htop

```sh
sudo dnf install htop
```

# Postman

```sh
cd ~/.local/share/applications

[Desktop Entry]
Version=1.0
Name=Postman
Exec=/home/pchaves/Apps/Postman/Postman
Icon=/home/pchaves/Apps/Postman/postman.png
Terminal=false
Type=Application
X-GNOME-UsesNotifications=true
```

# Time Doctor

```sh
sudo dnf install libpng12
sudo dnf install wine
```

# VirtualBox

```sh
sudo rpm --import oracle_vbox.asc
sudo dnf install kernel-devel-5.0.5-200.fc29.x86_64
sudo dnf install ./VirtualBox-6.0-6.0.4_128413_fedora29-1.x86_64.rpm
```
