# Setup fzf
# ---------
if [[ ! "$PATH" == */home/paulo/.fzf/bin* ]]; then
  export PATH="$PATH:/home/paulo/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/paulo/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/paulo/.fzf/shell/key-bindings.zsh"
