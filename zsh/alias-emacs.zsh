# -*- mode: sh -*-

# emacs command
alias em=emacs.sh

# emacs client
alias et="emacsclient.sh --tty"
alias ec="emacsclient.sh"

# daemon
alias e="background-connect-emacs-daemon.sh"
alias ed="up-emacs-daemon.sh"
alias ek="kill-emacs-server.sh"
alias er="ek && ed"
alias eu="emacsclient.sh -e '(daemonp)'"
alias ei="emacsclient.sh -e '(emacs-init-time)'"