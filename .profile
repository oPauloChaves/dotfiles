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
