export ZSH=$HOME/.oh-my-zsh

plugins=(git zsh-syntax-highlighting nin-vi-mode)

ZSH_THEME="powerlevel9k/powerlevel9k"
# configs para o powerlevel9k theme
POWERLEVEL9K_DISABLE_RPROMPT=true

# User configuration
export RUST_SRC_PATH=~/code/lib/rust/src/src
export RACER_PATH=~/code/lib/rust/racer/target/release
export LANG=en_US.UTF-8
export TERM=xterm-256color
export EDITOR=vim
PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$RACER_PATH"
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH

eval `dircolors ~/.osx-config/.dircolors/dircolors.256dark`

source $ZSH/oh-my-zsh.sh

# aliases
alias c='clear'
alias vi='vim'
alias s='source ~/.zshrc'

# configs de zsh
export DISABLE_AUTO_TITLE="true"
setopt extended_glob

# configurações do modo vi do zsh
export KEYTIMEOUT=1
