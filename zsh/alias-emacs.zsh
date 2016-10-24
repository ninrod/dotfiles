# -*- mode: sh -*-

# main
alias e="connect-emacs-terminal-daemon.sh"
alias eg="connect-emacs-gui-daemon.sh"

# start daemon
alias ed="terminal-emacs-daemon-up.sh"
alias egd="gui-emacs-daemon-up.sh"
alias eed="ed; egd"

# kill deamon
alias ek="kill-terminal-emacs-server.sh"
alias egk="kill-gui-emacs-server.sh"
alias eek="ek; egk"

# restart daemon
alias er='ek && ed'
alias egr='egk && egd'
alias eer='er; egr;'

# inspect daemon state
alias eu="ps -ef | ag 'macs.*\-\-daemon.*terminal'"
alias egu="ps -ef | ag 'macs.*\-\-daemon.*gui'"
alias ep="ps -ef | ag macs"
