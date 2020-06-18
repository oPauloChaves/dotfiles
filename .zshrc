# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/paulo/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  node
  npm
  docker
  docker-compose
  zsh-autosuggestions
  zsh-syntax-highlighting
  history-substring-search
)

source $ZSH/oh-my-zsh.sh

# User configuration

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias zshconfig="vim ~/.zshrc"

# original by: www.growingwiththeweb.com/2018/01/slow-nvm-init.html
# fork: https://gist.github.com/oPauloChaves/ab12cbf568e10a1fdae906550ce0f5fa
# if [ -s "$HOME/.nvm/nvm.sh" ] && [ ! "$(type -f __init_nvm)" = function ]; then
#   export NVM_DIR="$HOME/.nvm"
# 
#   [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
#   declare -a __node_commands=('nvm' 'node' 'npm' 'yarn' 'gulp' 'webpack', 'serve')
#   function __init_nvm() {
#     for i in "${__node_commands[@]}"; do unalias $i; done
#     . "$NVM_DIR"/nvm.sh
#     unset __node_commands
#     unset -f __init_nvm
#   }
#   for i in "${__node_commands[@]}"; do alias $i='__init_nvm && '$i; done
# fi


# https://browntr elabs.com/base-16-shell-and-why-its-so-awsome/
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

export EDITOR=vim

if [ -d "/usr/local/go" ]; then
  export PATH="$PATH:/usr/local/go/bin:/home/paulo/go/bin"
  export GOPATH=$HOME/go
  export GO111MODULE=on
fi

if [ -d "$HOME/.rbenv" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

if [ -d "$HOME/bin" ]; then
  export PATH="$HOME/bin:$PATH"
fi

export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'

for file in $HOME/.zsh.d/*.zsh; do
  source "$file"
done

# bin ctrl + space to accept current suggestion
bindkey '^ ' autosuggest-accept
bindkey '^X' autosuggest-execute

bindkey "^P" history-substring-search-up # Ctrl + p
bindkey "^N" history-substring-search-down # Ctrl + n

# when running under WSL
if grep -q microsoft /proc/version; then
  unset APPDATA
fi

# When working with Android & Flutter
# if [ -d "$HOME/flutter" ]; then
#   export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
#   export ANDROID_HOME="$HOME/Android/Sdk"
#   export PATH="$JAVA_HOME/bin:$HOME/flutter/bin:$PATH"
#   export PATH=$ANDROID_HOME/cmdline-tools/latest:$PATH
#   export PATH=$ANDROID_HOME/cmdline-tools/latest/bin:$PATH
#   export PATH=$ANDROID_HOME/platform-tools:$PATH
# fi

### npm global config
### https://github.com/sindresorhus/guides/blob/master/npm-global-without-sudo.md
NPM_PACKAGES="${HOME}/.npm"
export PATH="$PATH:$NPM_PACKAGES/bin"

# Preserve MANPATH if you already defined it somewhere in your config.
# Otherwise, fall back to `manpath` so we can inherit from `/etc/manpath`.
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"
