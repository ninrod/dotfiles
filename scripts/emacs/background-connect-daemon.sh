#!/bin/sh

log_file=~/.dotfiles/scripts/emacs/log/background-connect-daemon.log

nohup connect-emacs-daemon.sh "$@" > $log_file 2>&1 &
# tail -f $log_file
