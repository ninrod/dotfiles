#!/bin/sh

log_file=~/.dotfiles/scripts/emacs/log/background-connect-tty.log

nohup connect-emacs-tty-daemon.sh "$@" > $log_file 2>&1 &
# tail -f $log_file
