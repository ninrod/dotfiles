# -*- mode: sh -*-

# main
alias e="connect-emacs-terminal-daemon.sh"
alias eg="connect-emacs-gui-daemon.sh"

# emacs terminal daemon
alias ed="terminal-emacs-daemon-up.sh"
alias ek="kill-terminal-emacs-server.sh"
alias er='ek && ed'

# emacs gui daemon
alias egd="gui-emacs-daemon-up.sh"
alias egk="kill-gui-emacs-server.sh"
alias egr='egk && egd'

# inspect specific emacs daemon instances
alias eu="ps -ef | ag 'macs.*\-\-daemon.*terminal'"
alias egu="ps -ef | ag 'macs.*\-\-daemon.*gui'"

# inspect all emacs instances 
alias ep="ps -ef | ag macs"
