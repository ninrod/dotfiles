#!/bin/sh

if pgrep Emacs > /dev/null; then
  echo 'emacs is already up. proceeding to client...'
else
  echo 'emacs is not running. calling emacs server...'
  ~/Applications/Emacs.app/Contents/MacOS/Emacs -nw --daemon
fi

~/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -c -t "$@"
