#!/bin/sh

up-emacs-daemon.sh
emacsclient.sh --create-frame "$@"