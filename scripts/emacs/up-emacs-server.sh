#!/bin/sh

if ps -ef | ag 'macs.*\-\-daemon.*terminal' > /dev/null; then
  echo "emacs daemon is already running, nothing to do."
  exit 0
fi

echo "Emacs daemon is stopped. bringing it up."

emacs.sh -nw --daemon=terminal; rc=$?
if [[ $rc = 0 ]]; then
  echo 'emacs daemon started. success.'
else
  echo "there was a problem starting emacs daemon: $rc"
fi
