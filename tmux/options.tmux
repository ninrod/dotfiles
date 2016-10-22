# -*- mode: sh -*-

# Prevent tmux from renaming the tab when processes change
set-option -g allow-rename off

# Tells tmux up front what shell to expect
def_shell=/bin/zsh
set-option -g default-shell $def_shell

# Set base to 1
set -g base-index 1

# Enable UTF-8 support in status bar
set -g status on

# Increase scrollback lines
set -g history-limit 30000

# Renumber windows automatically after removing a window
set-option -g renumber-windows on
