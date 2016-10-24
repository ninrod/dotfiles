# -*- mode: sh -*-

# main
alias e="connect-emacs-terminal-daemon.sh"

# emacs server management
alias ed="terminal-emacs-daemon-up.sh"
alias ek="kill-terminal-emacs-server.sh"
alias er='ek && ed'

alias eu="ps -ef | ag 'macs.*\-\-daemon.*terminal'"
alias ep="ps -ef | ag macs"
