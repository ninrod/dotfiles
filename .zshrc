# config do oh-my-zsh
ZSH_THEME="powerlevel9k/powerlevel9k"
plugins=(zsh-syntax-highlighting nin-vi-mode)

# tema do prompt do zsh
ZSH_THEME="powerlevel9k/powerlevel9k"

# configs para o powerlevel9k theme
POWERLEVEL9K_DISABLE_RPROMPT=true

# User configuration
export LANG=en_US.UTF-8
export TERM=xterm-256color
export EDITOR=vim

# configurando o PATH
export RUST_SRC_PATH=~/code/lib/rust/src/src
export RACER_PATH=~/code/lib/rust/racer/target/release
PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$RACER_PATH"
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
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
