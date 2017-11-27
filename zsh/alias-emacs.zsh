# -*- mode: sh -*-

# emacs client
alias e="emacsclient"
alias et="emacsclient --tty"
alias eg="emacsclient --create-frame < /dev/null &>/dev/null &"

# daemon
alias eb="background-connect-emacs-daemon.sh"
alias ed="up-emacs-daemon.sh"
alias ek="kill-emacs-server.sh"
alias er="ek && ed"
alias eu="emacsclient -e '(daemonp)'"
alias ei="emacsclient -e '(emacs-init-time)'"
