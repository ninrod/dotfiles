#!/bin/sh

set -e
EMACSCLIENT=~/Applications/Emacs.app/Contents/MacOS/bin/emacsclient
exec $EMACSCLIENT -t -a ~/.dotfiles/scripts/emacs-terminal.sh "$@"
