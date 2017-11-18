#!/bin/sh

up-emacs-daemon.sh
emacsclient --create-frame "$@"
