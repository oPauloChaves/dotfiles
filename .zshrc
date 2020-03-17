# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/paulo/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  docker
  docker-compose
  zsh-autosuggestions
  zsh-syntax-highlighting
  history-substring-search
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias zshconfig="vim ~/.zshrc"

# TODO: move functions to another file
# from https://unix.stackexchange.com/a/291611
# string manipulation: http://www.tldp.org/LDP/abs/html/string-manipulation.html
# function path_remove {
#   # Delete path by parts so we can never accidentally remove sub paths
#   PATH=${PATH//":$1:"/":"} # delete any instances in the middle
#   PATH=${PATH/#"$1:"/} # delete any instance at the beginning
#   PATH=${PATH/%":$1"/} # delete any instance in the at the end
# }

# original by: www.growingwiththeweb.com/2018/01/slow-nvm-init.html
# fork: https://gist.github.com/oPauloChaves/ab12cbf568e10a1fdae906550ce0f5fa
if [ -s "$HOME/.nvm/nvm.sh" ] && [ ! "$(type -f __init_nvm)" = function ]; then
  export NVM_DIR="$HOME/.nvm"

  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
  declare -a __node_commands=('nvm' 'node' 'npm' 'yarn' 'gulp' 'webpack')
  function __init_nvm() {
    for i in "${__node_commands[@]}"; do unalias $i; done
    . "$NVM_DIR"/nvm.sh
    unset __node_commands
    unset -f __init_nvm
  }
  for i in "${__node_commands[@]}"; do alias $i='__init_nvm && '$i; done
fi


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

# its presence caused sharp faild to build, cuz the script that installs libvips was using it instead
# of the npm config dir on linux (happened on WSL using wsltty terminal)
unset APPDATA

## not working
# if grep -q microsoft /proc/version; then
#   # https://github.com/Microsoft/WSL/issues/3183#issuecomment-583354795
#   if ! pgrep ssh-agent > /dev/null; then
#     rm -f /tmp/ssh-auth-sock
#     eval "$(ssh-agent -s -a /tmp/ssh-auth-sock)"
#     ssh-add
#   else
#     export SSH_AUTH_SOCK=/tmp/ssh-auth-sock
#   fi
# fi

# export DISPLAY=192.168.0.142:0

# Android dev & Flutter
# if [ -d "$HOME/flutter" ]; then
#   export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
#   export ANDROID_HOME="$HOME/Android/Sdk"
#   export PATH="$JAVA_HOME/bin:$HOME/flutter/bin:$PATH"
#   export PATH=$ANDROID_HOME/cmdline-tools/latest:$PATH
#   export PATH=$ANDROID_HOME/cmdline-tools/latest/bin:$PATH
#   export PATH=$ANDROID_HOME/platform-tools:$PATH
# fi
