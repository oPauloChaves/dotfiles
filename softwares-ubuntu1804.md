# Ubuntu 18.04

### TimeDoctor

```sh
sudo apt-get install libappindicator1 libxss1 libxmu6 libjpeg62 libpng16-16
```

### curl

```sh
sudo apt-get install curl
```

### Keepass

```sh
sudo apt-get install keepassx
```

### P7

```sh
sudo apt-get install p7zip-full p7zip-rar
```

### Neovim

```sh
curl -l https://github.com/neovim/neovim/releases/download/v0.4.3/nvim.appimage > ~/nvim.appimage
chmod +x nvim.appimage
mv nvim.appimage nvim
sudo mv nvim /usr/local/bin/

sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor

sudo apt-get install software-properties-common

sudo apt-get install python-dev python-pip python3-dev python3-pip

# YCM dependencies
sudo apt install build-essential cmake python3-dev
```

### Tmux

```sh
sudo apt-get install tmux

# plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### Node.js

```sh
curl -sL https://deb.nodesource.com/setup_11.x | sudo -E bash -
sudo apt-get install -y nodejs

# Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn

# Resolving EACCES permissions errors when installing packages globally
# https://docs.npmjs.com/resolving-eacces-permissions-errors-when-installing-packages-globallyo
```

### Source Code Pro font

```sh
git clone --depth 1 --branch release https://github.com/adobe-fonts/source-code-pro.git ~/.fonts/adobe-fonts/source-code-pro
fc-cache -f -v ~/.fonts/adobe-fonts/source-code-pro
```

### ripgrep

```sh
# ripgrep (rg) recursively searches directories for a regex pattern

curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb
sudo dpkg -i ripgrep_11.0.2_amd64.deb
```

### dotfiles

```sh
mkidr ~/Code && cd ~/Code
git clone https://github.com/oPauloChaves/dotfiles.git
```

### ZSH

```sh
sudo apt-get install zsh

# Making zsh your default shell
chsh -s $(which zsh)

# Installing antibody (a shell plugin manager)
curl -sL git.io/antibody | sh -s

# Configuring
cd ~/Code/dotfiles
sh install.sh
```

### Install vim plugins

```sh
# run after configs above
vim +PlugInstall +qa
vim +PlugUpdate +qa # update plugins
```

### Docker

```sh
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common


curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# verify key
sudo apt-key fingerprint 0EBFCD88

# expected 9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

# Post-installation steps for Linux
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

### Gimp

```sh
sudo apt-get install gimp
```

### Elixir

```sh

wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb
sudo apt-get update
sudo apt-get install esl-erlang
sudo apt-get install elixir
```

### Htop

```sh
sudo apt-get install htop
```

### Apps

* MailSpring
* Slack
* MegaSync
* Skype
* VS Code
* Postman
* Telegram

### Postman

```sh
vim ~/.local/share/application/postman.desktop

[Desktop Entry]
Version=1.0
Name=Postman
Exec=/home/paulo/Apps/Postman/Postman
Icon=/home/paulo/Apps/Postman/postman.png
Terminal=false
Type=Application
X-GNOME-UsesNotifications=true

# set executable permissions for shortcut
cd ~/.local/share/applications
chmod +x postman.desktop
```

### Gnome Tweak Tool

```sh
# https://linuxhint.com/install-vimix-theme-linux/
# Allow changing themes

sudo apt-get install gnome-tweak-tool
```

### Papirus Icon Theme

```sh
sudo add-apt-repository ppa:papirus/papirus
sudo apt-get update
sudo apt-get install papirus-icon-theme
```

### Install Vimix Theme

```sh
# requirement
sudo apt-get install gtk2-engines-murrine gtk2-engines-pixbuf
cd ~/some-folder
git clone git@github.com:vinceliuice/vimix-gtk-themes.git
cd vimix-gtk-themes
./Install
```
