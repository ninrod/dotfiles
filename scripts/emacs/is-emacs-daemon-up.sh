#!/usr/bin/env bash

# taken from: http://fontawesome.io/cheatsheet/
# other: 

# green = #00cd66
# red = #fb4934
# emacs = #873eb4
emacsclient -e '(daemonp)' > /dev/null 2>&1 && echo %{F#873eb4} || echo %{F#fb4934}
