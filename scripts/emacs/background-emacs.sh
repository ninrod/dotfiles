#!/bin/sh

log_file=~/.dotfiles/scripts/emacs/log/background-emacs.log

nohup emacs.sh "$@" > $log_file 2>&1 &
# tail -f $log_file
