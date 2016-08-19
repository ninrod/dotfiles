#!/bin/sh

set -e
exec "$DOTPATH/scripts/emacsclient.sh" -c -a "$DOTPATH/scripts/emacs-gui.sh" "$@"
