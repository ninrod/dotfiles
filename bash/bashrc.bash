# bash options {{{

set -o vi
shopt -s autocd

# dot not print meta chars, e.g. `ˆC` when <C-c> is pressed to escape a command
stty -echoctl

# }}}
# exports {{{

export LANG=en_US.UTF-8
export TERM=xterm-256color
export EDITOR=vim

# }}}
# path {{{

PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH

# }}}
# plugins {{{

# colors for GNU ls (from coreutils)
eval `dircolors ~/.lscolors`

# }}}
# terminal colors {{{

TC='\e['
Rst="${TC}0m"
Black="${TC}30m";
Red="${TC}31m";
Green="${TC}32m";
Yellow="${TC}33m";
Blue="${TC}34m";
Purple="${TC}35m";
Cyan="${TC}36m";
White="${TC}37m";

# }}}
# alias | binds {{{

alias ag='ag --hidden --path-to-agignore=~/.agignore'
alias b='cd ..'
alias c='clear'
alias q='exit'
alias t='tmux'

alias l='ls -lh'
alias la='l -A'
alias ls='ls --color=auto --group-directories-first -X'

alias dot='la `find ~ -maxdepth 1 -type l`'

alias tarc='tar -zcvf file.tar.gz'
alias tarx='tar -zxvf'

alias v='vim'
alias vi='vim -u NONE'
alias vv='v ~/.vimrc'
alias vz='v ~/.bashrc'

alias w='echo -e "$Blue $PWD ${Red}at ${Cyan}$(whoami)${Red}@${Yellow}$(hostname -s)$Red in $Yellow${0}$Purple \$"'

# git {{{

# check
alias g='git status -sb'
alias gi='builtin cd $(git rev-parse --show-toplevel)'
# add
alias gd='git diff'
alias gds='git diff --staged'
alias gal='git add -A'
alias ga='git add'
alias gc='git commit -m'
# sync
alias gf='git fetch'
alias gp='git push'
alias gm='git merge'
alias gr='git rebase'
# branch
alias gg='git branch -vv'
alias gb='git branch'
alias gco='git checkout'
# log
alias git_log_custom='git log --pretty=format:"%C(yellow)%h%Creset %C(cyan)%>(14)%ad%Creset %C(magenta)%<(7)%an%Creset %C(blue)%d%Creset %C(white)%s%Creset" --abbrev=7 '
alias gld='git_log_custom --graph --date=format:"%Y-%m-%d %H:%M:%S"'
alias gl='gld --date=relative'
alias git_log_nocolor_custom='git log --no-color --pretty=format:"%h %d %ad %an %s" '
alias gldnc='git_log_nocolor_custom --graph'
alias glnc='gldnc --date=relative'
# ls-files
alias glsu='git ls-files --others --exclude-standard'
alias glsi='git ls-files -oiX .gitignore'

# }}}

# }}}
# custom functions {{{

md () {
  mkdir -p $1
  cd $1
}

# }}}
# prompt {{{

export PS1="${Blue}\w ${Red}\u${Cyan}@${Yellow}\h ${Purple}#${Rst} "

# }}}
