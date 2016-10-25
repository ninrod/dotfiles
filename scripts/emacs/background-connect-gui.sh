#!/bin/sh

log_file=~/.dotfiles/scripts/emacs/log/background-connect-gui.log

nohup connect-emacs-gui-daemon.sh "$@" > $log_file 2>&1 &
# tail -f $log_file
