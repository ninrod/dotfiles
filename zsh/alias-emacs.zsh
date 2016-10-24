# -*- mode: sh -*-

# main
alias e="connect-emacs-terminal-daemon.sh"
alias em="background-connect-gui.sh"

# start daemon
alias ed="up-terminal-emacs-daemon.sh"
alias emd="up-gui-emacs-daemon.sh"
alias eed="ed; emd"

# kill deamon
alias ek="kill-terminal-emacs-server.sh"
alias emk="kill-gui-emacs-server.sh"
alias eek="ek; emk"

# restart daemon
alias er='ek && ed'
alias emr='emk && emd'
alias eer='er; emr;'

# inspect daemon state
alias eu="ps -ef | ag 'macs.*\-\-daemon.*terminal'"
alias emu="ps -ef | ag 'macs.*\-\-daemon.*gui'"
alias eeu="ps -ef | ag macs"
