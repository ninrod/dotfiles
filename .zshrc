# tema do oh-my-zsh
ZSH_THEME="powerlevel9k/powerlevel9k"

# plugins do oh-my-zsh
plugins=(zsh-syntax-highlighting nin-vi-mode zsh-bd)

# configs para o powerlevel9k theme
POWERLEVEL9K_DISABLE_RPROMPT=false
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status vi_mode)
POWERLEVEL9K_STATUS_VERBOSE=false

POWERLEVEL9K_COLOR_SCHEME='light'

# POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND='064' #green
# POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='white'

# POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND='240' #grey
# POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND='white'

# Config do user
export LANG=en_US.UTF-8
export TERM=xterm-256color
export EDITOR=vim

# config do path
export GNUBIN_PATH=/usr/local/opt/coreutils/libexec/gnubin
export TEXBIN=/Library/TeX/texbin
export PACKER_BIN=~/bin/packer_0.8.6_darwin_amd64
PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
PATH="$GNUBIN_PATH:$PATH"
PATH="$TEXBIN:$PATH"
PATH="$PACKER_BIN:$PATH"
export PATH

# cores para o ls
eval `dircolors ~/.lscolors`

# inicialização do fasd
eval "$(fasd --init auto)"

# bootstrap do oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# alguns alias uteis
alias c='clear'
alias e='exit'
alias n='node'
alias v='vim'
alias o='open'
alias t='tree -d'
alias vi='vim -u NONE'
alias tarc='tar -zcvf file.tar.gz'
alias tarx='tar -zxvf'

# alias para o git
alias gs='git status'
alias g='git status --short'
alias gd='git diff'
alias ga='git add'
alias gal='git add -A'
alias gc='git commit -v'
alias gls='git log --graph --oneline'
alias gl='git log --pretty=format:"%C(yellow)%h%Creset %C(cyan)%ad%Creset %C(magenta)%an%Creset %s" --date=short --graph'
alias glnc='git log --pretty=format:"%h %ad %an %s" --date=short --graph'
alias glf='git log --follow -p -- '
alias gsd='git ls-files -d | sed "s/\/.*$//g" | sort | uniq'
alias gp='git push'
alias gf='git fetch'
alias gm='git merge'
alias gb='git branch '

# configs de 'open with'
alias -s txt=vim
alias -s js=vim
alias -s log=vim
alias -s html=vim
alias -s conf=vim

#configs do Ag (the silver searcher)
alias ag='ag --path-to-agignore=~/.agignore'

# o .oh-my-zsh cria um alias d que colide com o alias do fasd
unalias d
alias d='fasd -d'
alias di='dirs -v | head -n 10'
alias dic='dirs -c'

alias dot='l `find ~ -maxdepth 1 -type l`'

# easier to use than rm -r | rm -rf alias
# OMZ already binds rd for rmdir.
unalias rd
alias rd='rm -r'
alias rdf='rm -rf'

# configs do zsh
alias print='print -l'
setopt extended_glob
