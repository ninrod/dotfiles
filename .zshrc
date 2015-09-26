# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

ZSH_THEME="ninrod"
# ZSH_THEME="agnoster"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git brew nin-vi-mode)

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

export DISABLE_AUTO_TITLE="true"

setopt extended_glob

alias c='clear'

docker-ip() {
  boot2docker ip 2> /dev/null
}

# configurações do modo vi do zsh
export KEYTIMEOUT=1
# export TERM=xterm-256color
