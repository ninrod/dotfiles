# -*- mode: sh -*-

# positions each window name to the left most edge of the status bar
set -g status-justify 'left'

# adds separator (in this case some extra breathing space around the list of windows)
setw -g window-status-separator ' '

# TODO check the real need for this
set -g status-right '%R | %a | %d.%b.%y | #[fg=red]@#H'
setw -g window-status-current-format '[#I.#W]'

# load symlinked theme specific tmux bar configuration generated via tmuxline.vim
source ~/.tmux.d/tmuxline/simpledark.tmux
