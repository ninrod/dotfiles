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
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/home/vagrant/.linuxbrew/bin"
export LANG=en_US.UTF-8
export TERM=xterm-256color

alias c='clear'
alias gw='grunt server-stubby'
alias nm='node mocks/rest_mock.js'
alias gr='grunt stubby'

docker-ip() {
  boot2docker ip 2> /dev/null
}

# configurações do modo vi do zsh
export KEYTIMEOUT=1
