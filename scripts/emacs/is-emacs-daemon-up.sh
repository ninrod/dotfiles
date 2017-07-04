#!/usr/bin/env bash

# other: 

emacsclient -e '(daemonp)' > /dev/null 2>&1 && echo  || echo 
