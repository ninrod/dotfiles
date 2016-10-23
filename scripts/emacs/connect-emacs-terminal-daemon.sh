#!/bin/sh

terminal-emacs-daemon-up.sh
emacsclient --server-file=terminal -nw "$@"
