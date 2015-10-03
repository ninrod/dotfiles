export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="powerlevel9k/powerlevel9k"

plugins=(git nin-vi-mode)

# configs para o powerlevel9k theme
POWERLEVEL9K_DISABLE_RPROMPT=true

source $ZSH/oh-my-zsh.sh

# User configuration
export RUST_SRC_PATH=~/code/lib/rust/src/src
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/ninrod/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
export GOROOT=/usr/local/go
export GOPATH=~/code/lib/go
export RACER_PATH=~/code/lib/rust/racer/target/release
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$GOROOT/bin:$RACER_PATH"
export PATH=/usr/local/gradle-2.1/bin:$PATH
export LANG=en_US.UTF-8
export TERM=xterm-256color
export EDITOR=vim

# aliases
alias c='clear'
alias vi='vim'
alias s='source ~/.zshrc'

# configs de zsh
export DISABLE_AUTO_TITLE="true"
setopt extended_glob

# configurações do modo vi do zsh
export KEYTIMEOUT=1
