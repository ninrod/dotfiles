#!/bin/sh

up-tty-emacs-daemon.sh
emacsclient.sh --server-file=tty --create-frame --tty "$@"