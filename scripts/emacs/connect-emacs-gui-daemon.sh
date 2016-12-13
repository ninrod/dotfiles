#!/bin/sh

up-gui-emacs-daemon.sh
emacsclient.sh --server-file=gui -c -n "$@"