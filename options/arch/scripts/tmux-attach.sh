#!/usr/bin/env bash

[[ -z $TMUX ]] && { tmux attach || exec tmux new-session -A -s tmux -n shell; }