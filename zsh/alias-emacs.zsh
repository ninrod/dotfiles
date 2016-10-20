# -*- mode: sh -*-

# main
alias e="force-start-emacsclient.sh"
alias em="emacs.sh"
alias ec="emacsclient.sh"

# emacs server management
alias ed="up-emacs-server.sh"
alias ek="kill-emacs-server.sh"
alias er='ek && ed'
alias ep='pgrep -i emacs'

# edit init files
alias ei='e $(readlink -f ~/.emacs.d/boot.org)'
alias es='e $(readlink -f ~/.spacemacs.d/init.el)'
alias eo='e $(readlink -f ~/code/orgmode/oficina.org)'
