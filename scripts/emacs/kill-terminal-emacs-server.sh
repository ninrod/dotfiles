#!/bin/sh

if ! ps -ef | ag 'macs.*\-\-daemon' > /dev/null; then
  echo "emacs daemon is already stopped, nothing to do."
  exit 0
fi

echo 'emacs server is up. proceeding to the kill'

emacsclient.sh --server-file=terminal -e "(kill-emacs)"; rc=$?

if [[ $rc = 0 ]]; then
  echo 'emacs killed.'
else
  echo "there was a problem killing emacs: $rc"
fi
