#!/bin/sh

echo 'killing emacs server...'
emacsclient.sh --server-file=terminal -e "(kill-emacs)"; rc=$?

if [[ $rc = 0 ]]; then
  echo 'emacs killed.'
else
  echo "there was a problem killing emacs: $rc"
fi
