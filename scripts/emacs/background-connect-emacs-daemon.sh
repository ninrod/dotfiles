#!/usr/bin/env bash

nohup emacsclient --create-frame "$@" > /dev/null 2>&1 &
