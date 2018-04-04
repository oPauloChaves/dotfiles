# -*- mode: sh -*-

# positions each window name to the left most edge of the status bar
set -g status-justify 'left'

# adds separator (in this case some extra breathing space around the list of windows)
setw -g window-status-separator ' '

# TODO check the real need for this
# set -g status-right '%R | %a | %d.%b.%y | #[fg=red]@#H'
# setw -g window-status-current-format '[#I.#W]'

# This tmux statusbar config was created by tmuxline.vim
# on Tue, 01 Nov 2016

set -g status-bg "#202020"
set -g message-command-fg "#b0b0b0"
set -g status-justify "left"
set -g status-left-length "100"
set -g status "on"
set -g pane-active-border-fg "#ff3030"
set -g message-bg "#303030"
set -g status-right-length "100"
set -g status-right-attr "none"
set -g message-fg "#b0b0b0"
set -g message-command-bg "#303030"
set -g status-attr "none"
set -g pane-border-fg "#404040"
set -g status-left-attr "none"
setw -g window-status-fg "#505050"
setw -g window-status-attr "none"
setw -g window-status-activity-bg "#202020"
setw -g window-status-activity-attr "none"
setw -g window-status-activity-fg "#505050"
setw -g window-status-separator ""
setw -g window-status-bg "#202020"
set -g status-left "#[fg=#505050,bg=#202020] #S #[fg=#202020,bg=#202020,nobold,nounderscore,noitalics]"
set -g status-right "#[fg=#202020,bg=#202020,nobold,nounderscore,noitalics]#[fg=#505050,bg=#202020] %Y-%m-%d | %H:%M #[fg=#202020,bg=#202020,nobold,nounderscore,noitalics]#[fg=#505050,bg=#202020] #h "
setw -g window-status-format "#[fg=#505050,bg=#202020] #I |#[fg=#505050,bg=#202020] #W "
setw -g window-status-current-format "#[fg=#202020,bg=#303030,nobold,nounderscore,noitalics]#[fg=#b0b0b0,bg=#303030] #I |#[fg=#b0b0b0,bg=#303030] #W #[fg=#303030,bg=#202020,nobold,nounderscore,noitalics]"
