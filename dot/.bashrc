# global definitions {{{

if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# }}}

# exports {{{

export LANG=en_US.UTF-8
export TERM=xterm-256color
export EDITOR=vim

# }}}

# alias {{{

alias v='vim'
alias c='clear'
alias ls='ls --color=auto --group-directories-first'
alias l='ls -lah'
alias e='exit'
alias vz='v ~/.bashrc'

# }}}

# functions {{{

md () {
  mkdir -p $1
  cd $1
}

# }}}

# prompt {{{

export PS1="\e[34m\]\w\[\e[m\] \e[31m\]\u\[\e[m\]\e[36m\]@\[\e[m\]\e[33m\]cloud-t\[\e[m\] \e[35m\]#\[\e[m\] "

# }}}
