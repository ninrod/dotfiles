#!/usr/bin/env bash

nohup emacsclient --create-frame "$@" < /dev/null &>/dev/null &
