# -*- mode: sh -*-

# ls
alias ls='ls --color=auto --group-directories-first -X'
alias l='ls -lh'
alias la='l -A'

# quick alias
alias c='clear'
alias q='exit'
alias b='builtin cd ..'
alias w='echo -e "$Blue ${"$(pwd)"/$HOME/~} ${Red}at ${Cyan}$(whoami)${Red}@${Yellow}$(hostname -s)$Red using $Yellow${0}$Purple ${DOT_PROMPT_CHAR:-$}${Rst}"'
alias m='nman'
alias t='tmux'

# apps
alias ag='ag --hidden --path-to-agignore=~/.agignore'
alias ms='gfm-viewer'
alias tarc='tar -zcvf file.tar.gz'
alias tarx='tar -zxvf'

# zsh config
alias re='exec zsh'
alias r='echo -e "${Red}you have pressed \`r\`. careful. this repeats last command."'
alias dot='la $(find ~ -maxdepth 1 -type l)'

# docker {{{

alias dp='docker ps --format="table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Command}}\t{{.Status}}"'
alias dclean='drmf && drei'

# }}}
# emacs {{{

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

# }}}
# vim {{{

alias v="vim"
alias vi='vim -u NONE -N'

# fast edit frequent files
alias vt='v $(readlink -f ~/.tmux.conf)'
alias vv='v $(readlink -f ~/.vimrc)'
alias vz='v $(readlink -f ~/.zshrc)'
alias vo='v $(readlink -f ~/.options/shell-options.conf)'

# vim helping in emacs setup
alias ve='v $(readlink -f ~/.emacs.d/init.el)'
alias vs='v $(readlink -f ~/.spacemacs.d/init.el)'

# }}}
