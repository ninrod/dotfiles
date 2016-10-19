# -*- mode: sh -*-

# alias {{{

# function alias {{{

# s and sk: get recursive dir size measurements {{{

# s: get megabytes measurement
# usage: s [-h] [path]
s() {
  if [[ -z ${1+x} ]]; then
    # no argument passed. measure current dir including hidden files.
    du -sm *(D) | sort -nr | head -n 20
    return 0
  fi
  # an argument was passed.
  if [[ $1 = '-h' ]]; then
    # -h switch: human readable size output, but it is not suitable for ordering with, e.g., command sort.
    if [[ -n ${2+x} ]]; then
      # if a path was passed, apply -h switch to the path
      du -sh $2
      return 0;
    else
      # if a path was not passed, apply -h switch to all files, including hidden files
      du -sh *(D)
    fi
  else
    # bogus argument. print error
    print -l 'bogus argument. check function documentation'
  fi
}

# sk: get kilobytes measurement. for human readable output check the s function
# usage: s [path]
sk() {
  if [[ -z ${1+x} ]]; then
    # no argument passed. measure current dir including hidden files.
    du -sk *(D) | sort -nr | head -n 20
    return 0;
  fi
  # argument passed.
  du -sk $1 | sort -nr | head -n 20
}

# }}}
# md: faster dir creation {{{

md() {
  mkdir -p $1
  builtin cd $1
}

# }}}
# =: front for the `bc` utility  {{{

# credits: original idea by github.com/arzzen/calc.plugin.zsh
# usage: = '1+1'
= () {
  bc -l <<< "$@"
}

# }}}

# }}}

# ls
alias ls='ls --color=auto --group-directories-first -X'
alias l='ls -lh'
alias la='l -A'

# quick alias
alias c='clear'
alias q='exit'
alias b='builtin cd ..'
alias w='echo -e "$Blue ${"$(pwd)"/$HOME/~} ${Red}at ${Cyan}$(whoami)${Red}@${Yellow}$(hostname -s)$Red using $Yellow${0}$Purple ${DOT_PROMPT_CHAR:-$}${Rst}"'
alias m='nman'
alias t='tmux'

# apps
alias ag='ag --hidden --path-to-agignore=~/.agignore'
alias ms='gfm-viewer'
alias tarc='tar -zcvf file.tar.gz'
alias tarx='tar -zxvf'

# zsh config
alias re='exec zsh'
alias r='echo -e "${Red}you have pressed \`r\`. careful. this repeats last command."'
alias dot='la $(find ~ -maxdepth 1 -type l)'

# git {{{

# check
alias g='git status -sb'
alias gi='builtin cd $(git rev-parse --show-toplevel)'
# add
alias gd='git diff'
alias gds='git diff --staged'
alias gal='git add -A'
alias ga='git add'
alias gc='git commit -m'
# sync
alias gf='git fetch'
alias gp='git push'
alias gm='git merge'
alias gr='git rebase'
# branch
alias gg='git branch -vv'
alias gb='git branch'
alias gco='git checkout'
# log
alias git_log_custom='git log --pretty=format:"%C(yellow)%h%Creset %C(cyan)%>(14)%ad%Creset %C(magenta)%<(7)%an%Creset %C(blue)%d%Creset %C(white)%s%Creset" --abbrev=7 '
alias gld='git_log_custom --graph --date=format:"%Y-%m-%d %H:%M:%S"'
alias gl='gld --date=relative'
alias git_log_nocolor_custom='git log --no-color --pretty=format:"%h %d %ad %an %s" '
alias gldnc='git_log_nocolor_custom --graph'
alias glnc='gldnc --date=relative'
# ls-files
alias glsu='git ls-files --others --exclude-standard'
alias glsi='git ls-files -oiX .gitignore'

# }}}
# pushd directory navigation {{{

alias d='dirs -v | head -n 20 | sort -k 2'
alias dic='dirs -c'
alias 1='cd +1'
alias 2='cd +2'
alias 3='cd +3'
alias 4='cd +4'
alias 5='cd +5'
alias 6='cd +6'
alias 7='cd +7'
alias 8='cd +8'
alias 9='cd +9'
alias 10='cd +10'
alias 11='cd +11'
alias 12='cd +12'
alias 13='cd +13'
alias 14='cd +14'
alias 15='cd +15'
alias 16='cd +16'
alias 17='cd +17'
alias 18='cd +18'
alias 19='cd +19'

# }}}
# docker {{{

alias dp='docker ps --format="table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Command}}\t{{.Status}}"'
alias dclean='drmf && drei'

# }}}
# emacs {{{

# main
alias e="force-start-emacsclient.sh"
alias em="emacs.sh"
alias ec="emacsclient.sh"

# emacs server management
alias ed="up-emacs-server.sh"
alias ek="kill-emacs-server.sh"
alias er='ek && ed'
alias ep='pgrep -i emacs'

# edit init files
alias ei='e $(readlink -f ~/.emacs.d/boot.org)'
alias es='e $(readlink -f ~/.spacemacs.d/init.el)'
alias eo='e $(readlink -f ~/code/orgmode/oficina.org)'

# }}}
# vim {{{

alias v="vim"
alias vi='vim -u NONE -N'

# fast edit frequent files
alias vt='v $(readlink -f ~/.tmux.conf)'
alias vv='v $(readlink -f ~/.vimrc)'
alias vz='v $(readlink -f ~/.zshrc)'
alias vo='v $(readlink -f ~/.options/shell-options.conf)'

# vim helping in emacs setup
alias ve='v $(readlink -f ~/.emacs.d/init.el)'
alias vs='v $(readlink -f ~/.spacemacs.d/init.el)'

# }}}
