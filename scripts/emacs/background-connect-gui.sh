#!/bin/sh

nohup connect-emacs-gui-daemon.sh "$@" > background-connect-gui.log 2>&1 & 
