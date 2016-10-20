# -*- mode: sh -*-

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
