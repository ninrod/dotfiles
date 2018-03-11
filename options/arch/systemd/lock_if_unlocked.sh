#!/usr/bin/env bash

if pgrep -x physlock; then
  echo "physlock already running, nothing to do"
  exit 0
fi

physlock -d
