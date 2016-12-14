# -*- mode: sh -*-

# standard
alias emacs="emacs.sh"
alias em="background-emacs.sh"

# daemon
alias e="connect-emacs-tty-daemon.sh"
alias ed="up-tty-emacs-daemon.sh"
alias ek="kill-tty-emacs-server.sh"
alias er="ek && ed"
alias eu="ps aux | ag 'macs.*\-\-old\-daemon'"
