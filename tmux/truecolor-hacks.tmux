# Ensure terminal starts with its own colour scheme (defined below)
set -g default-terminal "xterm-256color"

# add support for truecolor
# more info here: https://github.com/ninrod/tricks/blob/master/shell/tmux.md#the-standard-way-since-tmux-22
# tmux issue: https://github.com/tmux/tmux/issues/34
# fixed since version 2.2
# credits to github user sunaku: http://github.com/sunaku 
# usage instructions: http://sunaku.github.io/tmux-24bit-color.html#usage
set-option -ga terminal-overrides ",xterm-256color:Tc"