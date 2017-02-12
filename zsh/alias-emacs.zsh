# -*- mode: sh -*-

# gui
alias emacs="background-emacs.sh"

# terminal
alias et="emacsclient.sh --tty"

# daemon
alias e="background-connect-emacs-daemon.sh"
alias ed="up-emacs-daemon.sh"
alias ek="kill-emacs-server.sh"
alias er="ek && ed"
alias eu="emacsclient.sh -e '(daemonp)'"
alias ei="emacsclient.sh -e '(emacs-init-time)'"