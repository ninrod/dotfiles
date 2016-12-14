#!/bin/sh

if ! ps aux | ag 'macs.*\-\-old\-daemon' > /dev/null; then
  echo "emacs tty daemon is already stopped, nothing to do."
  exit 0
fi

echo 'emacs tty server is up. proceeding to the kill'

emacsclient.sh --server-file=tty -e "(kill-emacs)"; rc=$?
if [[ $rc = 0 ]]; then
  echo 'emacs tty server killed.'
else
  echo "there was a problem killing emacs tty server: $rc"
fi
