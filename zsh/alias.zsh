# -*- mode: sh -*-

# ls
if (( $+commands[eza] )); then
  alias els='eza --color=auto --group-directories-first --sort=extension --icons=auto'
  alias el='eza --long --header --git --icons=auto'
  alias ela='eza --almost-all --icons=auto'
fi

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


# tmux
alias t="~/.dotfiles/scripts/tmux/tmux-attach.sh"

# dirs
if (( $+commands[zoxide] )); then
  alias d=zi
fi
alias 1='cd +1'

# BSSH: better ssh (ownz putty)
alias bssh="~/.dotfiles/scripts/terminal/bssh.sh"

# utils
alias open=xdg-open
