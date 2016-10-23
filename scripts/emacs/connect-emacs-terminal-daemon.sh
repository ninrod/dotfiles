#!/bin/sh

up-emacs-server.sh
emacsclient --server-file=terminal -nw "$@"
