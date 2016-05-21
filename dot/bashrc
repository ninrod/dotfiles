# bash options {{{

# TODO

set -o vi
shopt -s autocd

# }}}

# exports {{{

export LANG=en_US.UTF-8
export TERM=xterm-256color
export EDITOR=vim

# Enable a different cursor in NVIM in insert mode
export NVIM_TUI_ENABLE_CURSOR_SHAPE=1

# }}}

# path {{{

PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

export GNUBIN_PATH=/usr/local/opt/coreutils/libexec/gnubin
PATH="$GNUBIN_PATH:$PATH"

export FZF_BIN=~/.fzf/bin
PATH="$FZF_BIN:$PATH"
export PATH

# }}}

# plugins {{{

# colors for GNU ls (from coreutils)
eval `dircolors ~/.lscolors`

# }}}

# terminal colors {{{

TC='\e['

CLR_LINE_START="${TC}1K"
CLR_LINE_END="${TC}K"
CLR_LINE="${TC}2K"

# Hope no terminal is greater than 1k columns
RESET_LINE="${CLR_LINE}${TC}1000D"

# Colors and styles (based on https://github.com/demure/dotfiles/blob/master/subbash/prompt)

Bold="${TC}1m"    # Bold text only, keep colors
Undr="${TC}4m"    # Underline text only, keep colors
Inv="${TC}7m"     # Inverse: swap background and foreground colors
Reg="${TC}22;24m" # Regular text only, keep colors
RegF="${TC}39m"   # Regular foreground coloring
RegB="${TC}49m"   # Regular background coloring
Rst="${TC}0m"     # Reset all coloring and style

# Basic            High Intensity      Background           High Intensity Background
Black="${TC}30m";  IBlack="${TC}90m";  OnBlack="${TC}40m";  OnIBlack="${TC}100m";
Red="${TC}31m";    IRed="${TC}91m";    OnRed="${TC}41m";    OnIRed="${TC}101m";
Green="${TC}32m";  IGreen="${TC}92m";  OnGreen="${TC}42m";  OnIGreen="${TC}102m";
Yellow="${TC}33m"; IYellow="${TC}93m"; OnYellow="${TC}43m"; OnIYellow="${TC}103m";
Blue="${TC}34m";   IBlue="${TC}94m";   OnBlue="${TC}44m";   OnIBlue="${TC}104m";
Purple="${TC}35m"; IPurple="${TC}95m"; OnPurple="${TC}45m"; OnIPurple="${TC}105m";
Cyan="${TC}36m";   ICyan="${TC}96m";   OnCyan="${TC}46m";   OnICyan="${TC}106m";
White="${TC}37m";  IWhite="${TC}97m";  OnWhite="${TC}47m";  OnIWhite="${TC}107m";

# }}}

# alias | binds {{{

# Ag (the silver searcher)
alias ag='ag --hidden --path-to-agignore=~/.agignore'

# alias for frequent commands
alias ls='ls --color=auto --group-directories-first -X'
alias l='ls -lh'
alias la='l -A'
alias b='cd ..'
alias c='clear'
alias e='exit'
alias w='echo -e "$Blue $PWD ${Red}at ${Cyan}$(whoami)${Red}@${Yellow}$(hostname -s)$Red in $Yellow$0$Purple \$"'
alias m='nman'
[[ -z $(command -v vim) ]] && alias vim='vi'
alias vi='vim -u NONE'
alias v='vim'
alias k='k -h'
alias vz='v ~/.bashrc'
alias vv='v ~/.vimrc'
alias tarc='tar -zcvf file.tar.gz'
alias tarx='tar -zxvf'
alias dot='la `find ~ -maxdepth 1 -type l`'

# working with pushd and popd
alias di='dirs -v | head -n 10'
alias dic='dirs -c'
alias po='popd'

# git alias
alias g='git status --short'
alias gg='git branch -vv'
alias gs='git status'
alias ga='git add'
alias gal='git add -A'
alias gc='git commit -v'
alias gd='git diff'
alias gf='git fetch'
alias gm='git merge'
alias gp='git push'
alias gl='git log --pretty=format:"%C(yellow)%h%Creset %C(cyan)%ad%Creset %C(magenta)%an%Creset %s" --date=relative --graph'
alias gld='git log --pretty=format:"%C(yellow)%h%Creset %C(cyan)%ad%Creset %C(magenta)%an%Creset %s" --graph'
alias glf='git log --follow -p -- '
alias glnc='git log --pretty=format:"%h %ad %an %s" --date=short --graph'
alias gls='git log --graph --oneline'

# }}}

# custom functions {{{

md () {
  mkdir -p $1
  cd $1
}

f () {
  pushd $1 && c && l
}

cd () {
  if [ $# -eq 0 ]; then
    builtin cd ~
  elif [ "$1" == "-" ]; then
    builtin cd -
  else
    f $1
  fi
}

# neoman vim plugin
function nman () {
    if [[ -z $* ]]; then
        echo "What manual page do you want?"
        return
    fi
    local tmp=$IFS
    IFS=$'\n' out=($(command man -w $* 2>&1))
    local code=$?
    IFS=$tmp
    if [[ ${#out[@]} > 1 ]]; then
        echo "Too many manpages"
        return
    elif [[ $code != 0 ]]; then
        echo "No manual entry for $*"
        return
    fi
    vim -c "Nman $*"
}

# }}}

# prompt {{{

export PS1="${Blue}\w ${Red}\u${Cyan}@${Yellow}\h ${Purple}#${Rst} "

# }}}
