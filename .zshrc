#############
#zsh options
#############

# allows us to use ^ to negate globs
setopt extended_glob

# Setup the prompt with pretty colors
setopt prompt_subst

# cd helpers
setopt auto_cd
setopt cdablevars

# history configuration options
if [ -z "$HISTFILE" ]; then
    HISTFILE=$HOME/.zsh_history
fi
HISTSIZE=10000
SAVEHIST=10000
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data

# Changing/making/removing directory
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

# powerlevel9k theme config
POWERLEVEL9K_DISABLE_RPROMPT=false
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status vi_mode)
POWERLEVEL9K_STATUS_VERBOSE=false

# make powerlevel9k compatible with papercolor theme
POWERLEVEL9K_COLOR_SCHEME='light'
POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND='253' #green
POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='238' #almost black
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND='253' #grey
POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND='160' #red

source ~/.zplug/zplug

# local plugins
zplug "~/.zsh-plugins/powerlevel9k", from:local, of:powerlevel9k.zsh-theme
zplug "~/.zsh-plugins/nin-vi-mode", from:local
zplug "~/.zsh-plugins/zsh-bd", from:local
zplug "~/.zsh-plugins/zsh-syntax-highlighting", from:local

zplug load

# user configs
export LANG=en_US.UTF-8
export TERM=xterm-256color
export EDITOR=vim

# PATH configs
export GNUBIN_PATH=/usr/local/opt/coreutils/libexec/gnubin
export TEXBIN=/Library/TeX/texbin
export PACKER_BIN=~/bin/packer_0.8.6_darwin_amd64
PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# PATH="$GNUBIN_PATH:$PATH"
PATH="$TEXBIN:$PATH"
PATH="$PACKER_BIN:$PATH"
export PATH

# fasd bootstrap
eval "$(fasd --init auto)"

# colors for ls
if [[ "$(uname -s)" == "Darwin" ]]; then
    export LSCOLORS=exGxbEaEBxxEhEhBaDaCaD
    alias ls='ls -GF'
elif [[ "$(uname -s)" == "Linux" ]]; then
    eval `dircolors ~/.lscolors`
    alias ls='ls --color=auto'
fi

# alias for frequent commands
alias l='ls -lah'
alias c='clear'
alias e='exit'
alias m='nman'
alias n='node'
alias o='open'
alias t='tree -d'
alias vi='vim -u NONE'
alias v='vim'
alias tarc='tar -zcvf file.tar.gz'
alias tarx='tar -zxvf'
alias dot='l `find ~ -maxdepth 1 -type l`'
alias print='print -l'

# working with pushd and popd
alias di='dirs -v | head -n 10'
alias dic='dirs -c'
alias pu='pushd'
alias po='popd'

# directory manipulation
alias ..='cd ..'
alias md='mkdir -p'
alias rd='rm -r'
alias rdf='rm -rf'

# git alias
alias gs='git status'
alias g='git status --short'
alias gd='git diff'
alias ga='git add'
alias gal='git add -A'
alias gc='git commit -v'
alias gls='git log --graph --oneline'
alias gl='git log --pretty=format:"%C(yellow)%h%Creset %C(cyan)%ad%Creset %C(magenta)%an%Creset %s" --date=relative --graph'
alias gld='git log --pretty=format:"%C(yellow)%h%Creset %C(cyan)%ad%Creset %C(magenta)%an%Creset %s" --graph'
alias glnc='git log --pretty=format:"%h %ad %an %s" --date=short --graph'
alias glf='git log --follow -p -- '
alias gsd='git ls-files -d | sed "s/\/.*$//g" | sort | uniq'
alias gp='git push'
alias gf='git fetch'
alias gm='git merge'
alias gb='git branch '

# Ag (the silver searcher)
alias ag='ag --path-to-agignore=~/.agignore'

# neoman vim plugin
function nman {
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
