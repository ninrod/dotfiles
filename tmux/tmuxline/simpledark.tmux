# This tmux statusbar config was created by tmuxline.vim
# on Tue, 01 Nov 2016

set -g message-command-style fg="#b0b0b0",bg="#303030"
set -g message-style bg="#303030",fg="#b0b0b0"
set -g pane-active-border-style fg="#ff3030"
set -g pane-border-style fg="#404040"
set -g status-left-style none
set -g status-right-style none
set -g status-style bg="#202020"
set -g status-style none
setw -g window-status-activity-style bg="#202020",fg="#505050",none
setw -g window-status-style fg="#505050",bg="#202020",none

set -g status-left-length "100"
set -g status "on"
set -g status-right-length "100"

set -g status-justify "left"
setw -g window-status-separator ""

set -g status-left "#[fg=#505050,bg=#202020] #S #[fg=#202020,bg=#202020,nobold,nounderscore,noitalics]"
set -g status-right "#[fg=#202020,bg=#202020,nobold,nounderscore,noitalics]#[fg=#505050,bg=#202020] %H:%M - %d/%m/%Y #[fg=#202020,bg=#202020,nobold,nounderscore,noitalics]#[fg=#505050,bg=#202020] | #(echo $USER)@#h"
setw -g window-status-format "#[fg=#505050,bg=#202020] #I |#[fg=#505050,bg=#202020] #W "
setw -g window-status-current-format "#[fg=#202020,bg=#303030,nobold,nounderscore,noitalics]#[fg=#b0b0b0,bg=#303030] #I |#[fg=#b0b0b0,bg=#303030] #W #[fg=#303030,bg=#202020,nobold,nounderscore,noitalics]"
