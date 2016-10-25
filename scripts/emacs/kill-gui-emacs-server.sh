#!/bin/sh

if ! ps -ef | ag 'macs.*\-\-daemon' > /dev/null; then
  echo "emacs gui daemon is already stopped, nothing to do."
  exit 0
fi

echo 'emacs gui server is up. proceeding to the kill'

emacsclient.sh -e "(kill-emacs)"; rc=$?

if [[ $rc = 0 ]]; then
  echo 'emacs gui server killed.'
else
  echo "there was a problem killing emacs gui server: $rc"
fi
