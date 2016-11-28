# -*- mode: sh -*-

# vi mode settings
# Note: if you have EDITOR=vim set
# then the following two settings aren't needed
# Use Vi style key bindings to move around command line mode
set-option -g status-keys vi
# Use Vi style key bindings to move around copy mode
setw -g mode-keys vi
# Remove delay when pressing esc in Vim
set -sg escape-time 0

unbind C-b
set -g prefix C-Space

# Quick key for moving back to the previous window
bind-key p last-window

bind Space copy-mode
bind r next-layout

# Vim style bindings for pane movement
bind-key -r h select-pane -L
bind-key -r j select-pane -D
bind-key -r k select-pane -U
bind-key -r l select-pane -R

# vim splits
bind-key y split-window -h
bind-key x split-window -v

# moving panes
bind-key g command-prompt -p "join pane from:"  "join-pane -s '%%'"
bind-key s command-prompt -p "send pane to:"  "join-pane -t '%%'"

# Make resizing panes easier
bind-key < resize-pane -L 5
bind-key > resize-pane -R 5
bind-key Up resize-pane -U 5
bind-key Down resize-pane -D 5
bind-key = select-layout even-vertical
bind-key | select-layout even-horizontal

# ditched m which had select-pane -m
# this place a stronger visual cue on the selected pane
# add bind for mouse support toggle needs tmux 2.2
bind-key m set -g mouse

# toggles tmux bar on/off
bind-key - set status

#### directly bind function keys
# fast window selection
bind -n F1 select-window -t 1
bind -n F2 select-window -t 2
bind -n F3 select-window -t 3
bind -n F4 select-window -t 4
bind -n F5 select-window -t 5
bind -n F6 new-window

# renames tmux window
# more info here: http://unix.stackexchange.com/a/269542/155613
bind -n F7 command-prompt "rename-window '%%'"

# reload tmux config
bind -n F8 source ~/.tmux.conf

# rotate through different pre set layouts
bind -n F9 next-layout

# rotate through different pre set layouts
bind -n F10 copy-mode

# mouse support toggle needs tmux 2.2
bind -n F11 set -g mouse

# toggles tmux bar on/off
bind-key -n F12 set status

# switch panes using <M-arrow> without prefix
bind -n M-Left select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up select-pane -U
bind -n M-Down select-pane -D

# create panes with <C-arrow> prefix
bind -n C-M-Left split-window -h
bind -n C-M-Right split-window -h
bind -n C-M-Up split-window -v
bind -n C-M-Down split-window -v
