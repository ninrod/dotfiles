#!/bin/sh

up-emacs-server.sh

~/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -t -c "$@"
