#!/bin/sh

up-terminal-emacs-daemon.sh
emacsclient --server-file=terminal -nw "$@"
