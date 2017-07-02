#!/usr/bin/env bash

emacsclient -e '(daemonp)' 2>&1 > /dev/null; rc=$?
if [[ $rc == 0 ]]; then
  echo 1
else
  echo 0
fi
