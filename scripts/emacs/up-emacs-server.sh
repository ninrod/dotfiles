#!/bin/sh

if pgrep -i emacs > /dev/null; then
  echo 'emacs is running. Nothing to do.'
  exit 0
else
  echo 'emacs is not running. bringing it up.'
fi

emacs.sh -nw --daemon; rc=$?

if [[ $rc = 0 ]]; then
  echo 'emacs daemon started. success.'
else
  echo "there was a problem starting emacs daemon: $rc"
fi
