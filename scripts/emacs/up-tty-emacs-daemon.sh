#!/bin/sh

if ps aux | ag 'macs.*\-\-old\-daemon' > /dev/null; then
  echo "emacs tty daemon is already up, nothing to do."
  exit 0
fi

emacs.sh --daemon=tty; rc=$?
if [[ $rc = 0 ]]; then
  echo 'emacs tty daemon started. success.'
else
  echo "there was a problem starting emacs tty daemon: $rc"
fi
