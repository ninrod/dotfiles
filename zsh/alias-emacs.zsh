# -*- mode: sh -*-

# main
alias e="background-connect-gui.sh"

# start daemon
alias ed="up-gui-emacs-daemon.sh"

# kill deamon
alias ek="kill-gui-emacs-server.sh"

# restart daemon
alias er='ek && ed'

# inspect daemon state
alias eu="ps -ef | ag 'macs.*\-\-daemon'"
