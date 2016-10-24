# -*- mode: sh -*-

# main
alias e="connect-emacs-terminal-daemon.sh"
alias em="connect-emacs-gui-daemon.sh"

# start daemon
alias ed="terminal-emacs-daemon-up.sh"
alias emd="gui-emacs-daemon-up.sh"
alias eed="ed; emd"

# kill deamon
alias ek="kill-terminal-emacs-server.sh"
alias emk="kill-gui-emacs-server.sh"
alias eek="ek; emk"

# restart daemon
alias er='ek && ed'
alias emr='egk && emd'
alias eer='er; emr;'

# inspect daemon state
alias eu="ps -ef | ag 'macs.*\-\-daemon.*terminal'"
alias egu="ps -ef | ag 'macs.*\-\-daemon.*gui'"
alias ep="ps -ef | ag macs"
