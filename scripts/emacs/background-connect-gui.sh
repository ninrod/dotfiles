#!/bin/sh

nohup connect-emacs-gui-daemon.sh "$@" > ~/.dotfiles/scripts/emacs/log/background-connect-gui.log 2>&1 & 
