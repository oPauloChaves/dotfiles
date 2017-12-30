## [Tmux Plugin Manager](htt<kbd>ps:</kbd>//github.com/tmux-plugins/tpm)

Clone it

```
$ git clone htt<kbd>ps:</kbd>//github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Reload TMUX environment so TPM is sourced

```
# type this in terminal if tmux is already running
$ tmux source ~/.tmux.conf
```


## Shortcuts

#### Windows

- `prefix` + <kbd>c</kbd> Open a new window
- `prefix` + <kbd>x</kbd> Close current window
- `prefix` + <kbd>n</kbd> Next window
- `prefix` + <kbd>p</kbd> Previous window
- `prefix` + <kbd>w</kbd> List windows (press windows number to go to it)
- `prefix` + <kbd>,</kbd> Name window
- `prefix` + <kbd>1..9</kbd> Go to window number N
- `prefix` + <kbd>&</kbd> Kill current window

#### Split window

- `prefix` + <kbd>|</kbd> Split vertically
- `prefix` + <kbd>-</kbd> Split horizontally

#### Pane

- `prefix` + <kbd>j</kbd> Go to below pane
- `prefix` + <kbd>k</kbd> Go to above pane
- `prefix` + <kbd>h</kbd> Go to left pane
- `prefix` + <kbd>l</kbd> Go to right pane
- `prefix` + <kbd>J</kbd> Decrease height
- `prefix` + <kbd>K</kbd> Increase height
- `prefix` + <kbd>H</kbd> Decrease width
- `prefix` + <kbd>L</kbd> Increase width
- `prefix` + <kbd>Space</kbd> Toggle between layouts
- `prefix` + <kbd>o</kbd> swap panes
- `prefix` + <kbd>q</kbd> show pane numbers
- `prefix` + <kbd>x</kbd> Kill current pane (if it's the only pane, it also kills the window)
- `prefix` + <kbd>!</kbd> Break current pane into a new window (current window must have > 1 pane)
- `prefix` + <kbd>}</kbd> Move the current panel right
- `prefix` + <kbd>{</kbd> Move the current panel left

#### Scroll

- `prefix` + <kbd>[</kbd> Scroll up and down with arrow keys (press `Esq` or `q` to exit scroll)

#### Session

- `prefix` + <kbd>)</kbd> Find next session
- `prefix` + <kbd>(</kbd> Find previous session
- `prefix` + <kbd>$</kbd> Rename current session
- `prefix` + <kbd>d</kbd> Detach
- `prefix` + <kbd>s</kbd> list sessions

#### Others

- `prefix` + <kbd>?</kbd> List shortcuts
- `prefix` + <kbd>t</kbd> See current time (Esc to go back)
- `prefix` + <kbd>i</kbd> See info about current session, pane, open program, current time

