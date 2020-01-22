# -*- mode: sh -*-

# ls
alias ls='ls --color=auto --group-directories-first -X'
alias l='ls -lh'
alias la='l -A'

# quick alias
alias c='clear'
alias q='exit'
alias b='builtin cd ..'

alias w='echo -e "$Blue ${"$(pwd)"/$HOME/~} ${Red}at ${Cyan}$(whoami)${Red}@${Yellow}$(hostname -s)$Red \
using $Yellow${0}$Purple ${DOT_PROMPT_CHAR:-$}${Rst}"'

# apps
alias ag='ag --path-to-ignore ~/.ignore --hidden'

# https://unix.stackexchange.com/a/39296/155613
# use unaliased version of ag
alias agu='command ag --hidden -u -a'

alias tarc='tar -zcvf file.tar.gz'
alias tarx='tar -zxvf'

# zsh config
alias re='exec zsh'
alias dot='la $(find ~ -maxdepth 1 -type l)'

# dotfiles
alias r='~/.dotfiles/install.zsh'

# tmux
alias t="~/.dotfiles/scripts/tmux/tmux-attach.sh"

# dirs
alias d=show_and_choose
alias 1='cd +1'

# BSSH: better ssh (ownz putty)
alias bssh="~/.dotfiles/scripts/terminal/bssh.sh"
