#!/bin/sh

set -e
EMACSCLIENT=~/Applications/Emacs.app/Contents/MacOS/bin/emacsclient
exec $EMACSCLIENT -c -a ~/.dotfiles/scripts/emacs-gui.sh "$@"
