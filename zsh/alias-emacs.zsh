# -*- mode: sh -*-

# emacs command

# emacs client
alias e="emacsclient --create-frame"
alias et="emacsclient --tty"

# daemon
alias eb="background-connect-emacs-daemon.sh"
alias ed="up-emacs-daemon.sh"
alias ek="kill-emacs-server.sh"
alias er="ek && ed"
alias eu="emacsclient -e '(daemonp)'"
alias ei="emacsclient -e '(emacs-init-time)'"

