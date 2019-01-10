#!/bin/bash

if [[ -f $HOME/.Xmodmap ]]; then
  xmodmap -e "keycode 108 = Alt_R Meta_R Alt_R Meta_R"
  xmodmap $HOME/.Xmodmap
fi
