# if running bash
if [ -n "$BASH_VERSION" ]; then
	# include .bashrc if it exists
	if [ -f "$HOME/.bashrc" ]; then
		. "$HOME/.bashrc"
	fi
fi

# set PATH so it includes user's private bin directories
PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# set GOPATH and include Go bins
if [ -d "$HOME/go" ]; then
	GOPATH="$HOME/go"
	PATH="$GOPATH/bin:$PATH"
fi

# Android
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Install fd: https://github.com/sharkdp/fd
# follow symbolic links and don't exclude hidden files
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
