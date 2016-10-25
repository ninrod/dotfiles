#!/bin/sh

if ps -ef | ag 'macs.*\-\-daemon' > /dev/null; then
  echo "emacs gui daemon is already running, nothing to do."
  exit 0
fi

echo "Emacs gui daemon is stopped. bringing it up."

emacs.sh --daemon; rc=$?
if [[ $rc = 0 ]]; then
  echo 'emacs gui daemon started. success.'
else
  echo "there was a problem starting emacs gui daemon: $rc"
fi
