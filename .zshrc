# tema do oh-my-zsh
ZSH_THEME="powerlevel9k/powerlevel9k"

# plugins do oh-my-zsh
plugins=(zsh-syntax-highlighting nin-vi-mode)

# configs para o powerlevel9k theme
POWERLEVEL9K_DISABLE_RPROMPT=true

# Config do user
export LANG=en_US.UTF-8
export TERM=xterm-256color
export EDITOR=vim

# config do path
export RACER_PATH=~/code/lib/rust/racer/target/release
export RUST_SRC_PATH=~/code/lib/rust/src/src
export GNUBIN_PATH=/usr/local/opt/coreutils/libexec/gnubin
PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
PATH="$RACER_PATH:$PATH"
PATH="$GNUBIN_PATH:$PATH"
export PATH

# cores para o ls
eval `dircolors ~/.lscolors`

# bootstrap do oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# alguns alias uteis
alias c='clear'
alias vi='vim'
alias v='vim'
alias s='source ~/.zshrc'
alias tarc='tar -zcvf'
alias tarx='tar -zxvf'
alias n='node'

alias gs='git status'
alias ga='git add'
alias gc='git commit -v'
alias gp='git push'
alias gf='git fetch'
alias gm='git merge'

# configs do zsh
setopt extended_glob
