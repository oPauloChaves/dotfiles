autoload -Uz compinit

typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi

HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE

# remove older duplicate entries from history
setopt hist_ignore_all_dups
# remove superfluous blanks from history items
setopt hist_reduce_blanks
# save history entries as soon as they are entered
setopt inc_append_history
# share history between different instances of the shell
setopt share_history
# cd by typing directory name if it's not a command
setopt auto_cd
# automatically list choices on ambiguous completion
setopt auto_list
# automatically use menu completion
setopt auto_menu
# move cursor to end if word had one match
setopt always_to_end
# select completions with arrow keys
zstyle ":completion:*" menu select
# group results by category
zstyle ":completion:*" group-name ""
# enable approximate matches for completion
zstyle ":completion:::::" completer _expand _complete _ignored _approximate

# Load antibody plugin manager
source <(antibody init)

# Plugins
antibody bundle zdharma/fast-syntax-highlighting
antibody bundle zsh-users/zsh-autosuggestions
antibody bundle zsh-users/zsh-history-substring-search
antibody bundle zsh-users/zsh-completions
antibody bundle johanhaleby/kubetail

# Keybindings
bindkey "^P" history-substring-search-up # Ctrl + p
bindkey "^N" history-substring-search-down # Ctrl + n

bindkey "^[[3~" delete-char
bindkey "^[3;5~" delete-char

bindkey "^ " autosuggest-accept # Ctrl + space

SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  line_sep      # Line break
  exit_code     # Exit code section
  char          # Prompt character
)

SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL="➜"
SPACESHIP_CHAR_SUFFIX=" "

antibody bundle denysdovhan/spaceship-prompt

# --------------------------

# Run `nvm` init script on demand to avoid constant slow downs
function nvm {
  if [ -z ${NVM_DIR+x} ]; then
    export NVM_DIR="$HOME/.nvm"

    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

    nvm "$@"
  fi
}

# system's npm
# Fix permissions: https://docs.npmjs.com/resolving-eacces-permissions-errors-when-installing-packages-globally
if [ -f "/usr/bin/npm" ]; then
  export NPM_CONFIG_PREFIX="~/.npm-global"
  export PATH=~/.npm-global/bin:$PATH
fi

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