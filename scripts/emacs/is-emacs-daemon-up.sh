#!/usr/bin/env bash

# taken from: http://fontawesome.io/cheatsheet/
# other: 

emacsclient -e '(daemonp)' > /dev/null 2>&1 && echo %{F#39a} || echo %{F#d00}
