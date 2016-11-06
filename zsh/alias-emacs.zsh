# -*- mode: sh -*-

# main
alias e="background-connect-gui.sh"

# emacs
alias emacs="emacs.sh"

# start daemon
alias ed="up-gui-emacs-daemon.sh"

# kill deamon
alias ek="kill-gui-emacs-server.sh"

# inspect daemon state
alias eu="ps -ef | ag 'macs.*\-\-daemon'"
