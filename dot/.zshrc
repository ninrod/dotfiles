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
setopt auto_cd

# allows us to use ^ to negate globs
setopt extended_glob

# defining word endings
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

autoload -Uz compinit && compinit
zstyle ':completion:*' menu select

# }}}

# exports {{{

# needed in some machines
if [ -z ${SHELL+x}  ]; then
  export SHELL=$(which zsh)
fi

# standard configs
export LANG=en_US.UTF-8
export TERM=xterm-256color
export EDITOR=nvim

# Enable a different cursor in NVIM in insert mode
export NVIM_TUI_ENABLE_CURSOR_SHAPE=1

# ENHANCD customizations
export ENHANCD_COMMAND=d
export ENHANCD_FILTER=fzf-tmux

# FZF customizations
export FZF_DEFAULT_COMMAND='ag --hidden --path-to-agignore=~/.agignore -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
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

zplug "Tarrasch/zsh-bd"
zplug "b4b4r07/enhancd", of:enhancd.sh
zplug "felixr/docker-zsh-completion", if:"which docker", of:_docker
zplug "ninrod/nin-vi-mode"
zplug "supercrabtree/k"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", nice:10

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

# FZF Setup fzf
# -------------
if [[ ! "$PATH" == *.fzf/bin* ]]; then
  export PATH="$PATH:$HOME/.fzf/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" == */Users/ninrod/.fzf/man* && -d "$HOME/.fzf/man" ]]; then
  export MANPATH="$MANPATH:$HOME/.fzf/man"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$HOME/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$HOME/.fzf/shell/key-bindings.zsh"

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

# alias {{{

# Ag (the silver searcher)
alias ag='ag --hidden --path-to-agignore=~/.agignore'

# alias for frequent commands
alias ls='ls --color=auto --group-directories-first'
alias l='ls -lah'
alias b='cd ..'
alias c='clear'
alias e='exit'
alias a='echo -e "${Cyan}$(whoami)${Red}@${Yellow}$(hostname -s)"'
alias w='echo "$Blue $PWD"'
alias m='nman'
alias vi='vim -u NONE'
alias v='nvim'
alias k='k -h'
alias vz='v ~/.zshrc(:A)'
alias vv='v ~/.vimrc(:A)'
alias tarc='tar -zcvf file.tar.gz'
alias tarx='tar -zxvf'
alias dot='l `find ~ -maxdepth 1 -type l`'

# rust alias
alias rd='open /usr/local/share/doc/rust/html/index.html'

# working with pushd and popd
alias di='dirs -v | head -n 10'
alias dic='dirs -c'
alias po='popd'

# git alias
alias g='git status --short && git branch -vv'
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

# custom find

f () {
  local pattern=''
  local filetype='-type f'
  local execstm=''

  if [[ ! -z $1 ]]; then
    pattern="-name '$1'"
  fi

  if [[ ! -z $2 ]]; then
    filetype="-type $2"
  fi

  if [[ ! -z $3 ]]; then
    execstm="-exec $3"
  fi

  local custcmd="find . -name .git -prune -o ${pattern} ${filetype} -print ${execstm}"

  eval ${custcmd}
}

# faster dir creation
md () {
  mkdir -p $1
  cd $1
}

fd () {
  builtin cd $1
}

# enhancing enhancd
cd () {
  if [[ -z $1 ]]; then
    # $1 is empty. go home
    builtin cd ~
  elif [[ $1 == '-' ]]; then
    # $1 == '-': switch to last visited dir
    builtin cd -
  elif [[ $1 == '..' ]]; then
    builtin cd ..
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

######## dark

# very simple with directory truncation
PROMPT='%F{blue}%12<...<%1~%<<%f %F{magenta}#%f '

# showing whoami@hostname
# PROMPT='%F{blue}%1~%f %F{cyan}%n%f%F{red}@%f%F{yellow}%m%f %F{magenta}#%f '

# showing whaami@hostname and with truncation
# PROMPT="%F{blue}%10<...<%1~%<<%f %F{cyan}%n%f%F{red}@%f%F{yellow}%m%f %F{magenta}#%f "

# }}}

# FZF ZLE extra bindkeys {{{

bindkey '^E' fzf-cd-widget

# }}}
