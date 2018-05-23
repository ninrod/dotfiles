# check
alias g='git status -sb'
alias gv='git branch -vv'
alias gi='builtin cd $(git rev-parse --show-toplevel)'

# add
alias gd='git diff'
alias gds='git diff --staged'
alias gal='git add -A'
ealias ga='git add'
ealias gc='git commit -m'

# sync
alias gf='git fetch'
alias gp='git push'
alias gpf='git push --force-with-lease'
alias gm='git merge'
ealias gr='git reset'

# branch
ealias gb='git branch'
ealias gco='git checkout'
alias gg='git branch -vv'
alias gs='nohup gitg > /dev/null 2>&1 &'

# log
alias git_log_custom='git log --pretty=format:"%C(yellow)%h%Creset %C(cyan)%>(14)%ad%Creset %C(magenta)%<(7)%an%Creset %C(blue)%d%Creset %C(white)%s%Creset" --abbrev=7 '
alias gld='git_log_custom --graph --date=format:"%Y-%m-%d %H:%M:%S"'
alias gl='gld --date=relative'
alias gla='gld --date=relative --all'
alias glr='gld --date=relative --all --reflog'
alias glnc='git log --no-color'
alias glt="git log --no-color --date-order --tags --simplify-by-decoration --pretty=format:'%ai %h %d' --date=format:'%Y-%m-%d %H:%M:%S' | grep --color tag"
alias gls="gl --simplify-by-decoration"

# ls-files
alias glsu='git ls-files --others --exclude-standard'
alias glsi='git ls-files -oiX .gitignore'

# cleanup
alias git_kill_reflog='git reflog expire --expire-unreachable=now --all && git gc --aggressive --prune=now'
