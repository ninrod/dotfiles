# -*- mode: sh -*-

alias v="vim"
alias vi='vim -u NONE -N'

# fast edit frequent files
alias vt='v $(readlink -f ~/.tmux.conf)'
alias vv='v $(readlink -f ~/.vim/main.vim)'
alias vz='v $(readlink -f ~/.zshrc)'
alias vo='v $(readlink -f ~/.options/shell-options.conf)'

# vim helping in emacs setup
alias ve='v $(readlink -f ~/.emacs.d/init.el)'
alias vs='v $(readlink -f ~/.spacemacs.d/init.el)'
