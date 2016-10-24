#!/bin/sh

up-gui-emacs-daemon.sh
emacsclient --server-file=gui -c "$@"
