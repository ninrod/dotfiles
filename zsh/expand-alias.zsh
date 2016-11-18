# lifted from Gautam Lyer's blog:
# https://wiki.math.cmu.edu/iki/wiki/tips/20140625-zsh-expand-alias.html

typeset -a ealiases
ealiases=()

ealias () {
  alias $1
  ealiases+=(${1%%\=*})
}

expand-ealias () {
  if [[ $LBUFFER =~ "(^|[;|&])\s*(${(j:|:)ealiases})\$" ]]; then
    zle _expand_alias
    zle expand-word
  fi
  zle magic-space
}

zle -N expand-ealias

bindkey -M viins ' '    expand-ealias
bindkey -M viins '^ '   magic-space     # control-space to bypass completion
bindkey -M isearch " "  magic-space     # normal space during searches
