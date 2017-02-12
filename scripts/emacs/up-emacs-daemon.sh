#!/bin/sh

if emacsclient.sh -e "(ignore)" > /dev/null 2>&1; then
  echo "emacs daemon is already up, nothing to do."
  exit 0
else
  echo "emacs daemon is killed. Let us ressurect it..."
fi

emacs.sh --daemon; rc=$?
if [[ $rc = 0 ]]; then
  echo 'emacs daemon started. success.'
else
  echo "there was a problem starting emacs daemon: $rc"
fi
