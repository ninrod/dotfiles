#!/bin/sh

emacs.sh -nw --daemon=terminal; rc=$?
if [[ $rc = 0 ]]; then
  echo 'emacs daemon started. success.'
else
  echo "there was a problem starting emacs daemon: $rc"
fi
