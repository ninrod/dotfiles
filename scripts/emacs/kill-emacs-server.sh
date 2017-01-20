#!/bin/sh

if ! ps aux | ag 'macs.*\-daemon' > /dev/null; then
  echo "emacs daemon is already stopped, nothing to do."
  exit 0
fi

echo 'emacs server is up. proceeding to the kill'

emacsclient.sh -e "(kill-emacs)"; rc=$?
if [[ $rc = 0 ]]; then
  echo 'emacs server killed.'
else
  echo "there was a problem killing emacs server: $rc"
fi
