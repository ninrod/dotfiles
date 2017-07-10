# -*- mode: sh -*-

# emacs command

# emacs client
alias et="emacsclient --tty"
alias ec=emacsclient

# daemon
alias e="background-connect-emacs-daemon.sh"
alias ed="up-emacs-daemon.sh"
alias ek="kill-emacs-server.sh"
alias er="ek && ed"
alias eu="emacsclient -e '(daemonp)'"
alias ei="emacsclient -e '(emacs-init-time)'"

