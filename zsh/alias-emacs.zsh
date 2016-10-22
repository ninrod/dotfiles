# -*- mode: sh -*-

# main
alias e="connect-emacs-terminal-daemon.sh"

# emacs server management
alias ed="up-emacs-server.sh"
alias ek="kill-emacs-server.sh"
alias er='ek && ed'
alias ep='pgrep -i emacs'

# edit init files
alias ei='e $(readlink -f ~/.emacs.d/boot.org)'
alias es='e $(readlink -f ~/.spacemacs.d/init.el)'
alias eo='e $(readlink -f ~/code/orgmode/oficina.org)'
