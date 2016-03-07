# zsh options {{{

# history config options
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt append_history
setopt extended_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_verify
setopt share_history

# dir change options
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushd_silent

# allows us to use ^ to negate globs
setopt extended_glob

# defining word endings
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

autoload -Uz compinit && compinit
zstyle ':completion:*' menu select

# }}}

# exports {{{

export LANG=en_US.UTF-8
export TERM=xterm-256color
export EDITOR=nvim

# Enable a different cursor in NVIM in insert mode
export NVIM_TUI_ENABLE_CURSOR_SHAPE=1

export ENHANCD_COMMAND=d
export ENHANCD_FILTER=fzf-tmux

export FZF_DEFAULT_COMMAND='ag --hidden --path-to-agignore=~/.agignore -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# TODO fix me
export FZF_ALT_C_COMMAND="find . -path '*/.git' -prune -o -type d -print"


# }}}

# path {{{

export GNUBIN_PATH=/usr/local/opt/coreutils/libexec/gnubin
export TEXBIN=/Library/TeX/texbin
export PACKER_BIN=~/bin/packer_0.8.6_darwin_amd64
export ZPLUG_BIN=~/.zplug/bin
PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
PATH="$GNUBIN_PATH:$PATH"
PATH="$TEXBIN:$PATH"
PATH="$PACKER_BIN:$PATH"
PATH="$ZPLUG_BIN:$PATH"
export PATH

# }}}

# plugins {{{

# Zplug
source ~/.zplug/zplug
zplug "ninrod/nin-vi-mode"
zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "zsh-users/zsh-completions"
zplug "felixr/docker-zsh-completion", if:"which docker", of:_docker
zplug "b4b4r07/enhancd", of:enhancd.sh
zplug "Tarrasch/zsh-bd"
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    else
        echo
    fi
fi
zplug load

# colors for GNU ls (from coreutils)
eval `dircolors ~/.lscolors`

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# }}}

# alias {{{

# Ag (the silver searcher)
alias ag='ag --hidden --path-to-agignore=~/.agignore'

# alias for frequent commands
alias ls='ls --color=auto --group-directories-first'
alias l='ls -lah'
alias c='clear'
alias e='exit'
alias m='nman'
alias vi='vim -u NONE'
alias v='nvim'
alias vz='v ~/.zshrc(:A)'
alias vv='v ~/.vimrc(:A)'
alias tarc='tar -zcvf file.tar.gz'
alias tarx='tar -zxvf'
alias dot='l `find ~ -maxdepth 1 -type l`'

# working with pushd and popd
alias di='dirs -v | head -n 10'
alias dic='dirs -c'
alias po='popd'

# directory manipulation
alias rd='rm -r'
alias rdf='rm -rf'
alias b='bd 1'
alias ..='print \`..\` is not supported. please use \`b\` instead'

# git alias
alias g='git status --short'
alias gs='git status'
alias ga='git add'
alias gal='git add -A'
alias gc='git commit -v'
alias gd='git diff'
alias gf='git fetch'
alias gl='git log --pretty=format:"%C(yellow)%h%Creset %C(cyan)%ad%Creset %C(magenta)%an%Creset %s" --date=relative --graph'
alias gld='git log --pretty=format:"%C(yellow)%h%Creset %C(cyan)%ad%Creset %C(magenta)%an%Creset %s" --graph'
alias glf='git log --follow -p -- '
alias glnc='git log --pretty=format:"%h %ad %an %s" --date=short --graph'
alias gls='git log --graph --oneline'
alias gm='git merge'
alias gp='git push'

# }}}

# custom functions {{{

# faster dir creation
md () {
  mkdir -p $1
  cd $1
}

# enhancing enhancd
cd () {
  if [[ -z $1 ]]; then
    # $1 is empty. go home
    d ~
  elif [[ $1 == '-' ]]; then
    # $1 == '-': switch to last visited dir
    builtin cd -
  elif [[ $1 =~ '\+[0-9]{1,2}' ]]; then
    # $1: `cd +8`, `cd +10`, cherry pick auto_pushd stack
    builtin cd $1
  else
    # populate enhancd cache, clear screen, and list dir.
    d $1 && c && l
  fi
}


# front for `bc` utility (credit goes to arzzen/calc.plugin.zsh)
function = () {
  echo "$@" | bc -l
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
compdef nman="man"

# }}}

# prompt {{{

# light
# PROMPT='%F{cyan}%1~%f %F{red}#%f '

# dark
PROMPT='%F{blue}%1~%f %F{magenta}#%f '

# }}}

# ZLE test {{{

bindkey '^E' fzf-cd-widget

# }}}
