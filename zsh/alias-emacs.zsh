# -*- mode: sh -*-

# emacs client
alias e="emacsclient --tty"
alias et="emacsclient --tty"
alias eg="background-connect-emacs-daemon.sh"

# daemon
alias ed="up-emacs-daemon.sh"
alias ek="kill-emacs-server.sh"
alias er="ek && ed"
alias eu="emacsclient -e '(daemonp)'"
alias ei="emacsclient -e '(emacs-init-time)'"
