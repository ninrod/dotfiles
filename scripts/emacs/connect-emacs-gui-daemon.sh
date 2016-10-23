#!/bin/sh

gui-emacs-daemon-up.sh
emacsclient --server-file=gui "$@"
