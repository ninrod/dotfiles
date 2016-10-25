#!/bin/sh

up-gui-emacs-daemon.sh
emacsclient.sh -c "$@"
