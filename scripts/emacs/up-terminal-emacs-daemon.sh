#!/bin/sh

if ps -ef | ag 'macs.*\-\-daemon.*terminal' > /dev/null; then
  echo "emacs terminal daemon is already running, nothing to do."
  exit 0
fi

echo "Emacs terminal daemon is stopped. bringing it up."

emacs -nw --daemon=terminal; rc=$?
if [[ $rc = 0 ]]; then
  echo 'emacs terminal daemon started. success.'
else
  echo "there was a problem starting emacs terminal daemon: $rc"
fi
