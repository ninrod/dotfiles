#!/bin/sh

if ! ps -ef | ag 'macs.*\-\-daemon.*terminal' > /dev/null; then
  echo "emacs terminal daemon is already stopped, nothing to do."
  exit 0
fi

echo 'emacs terminal server is up. proceeding to the kill'

emacsclient --server-file=terminal -e "(kill-emacs)"; rc=$?

if [[ $rc = 0 ]]; then
  echo 'emacs terminal daemon killed.'
else
  echo "there was a problem killing emacs terminal daemon: $rc"
fi
