# check
alias g='git status -sb'
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
ealias gr='git rebase'

# branch
alias gg='git branch -vv'
ealias gb='git branch'
ealias gco='git checkout'

# log
alias git_log_custom='git log --pretty=format:"%C(yellow)%h%Creset %C(cyan)%>(14)%ad%Creset %C(magenta)%<(7)%an%Creset %C(blue)%d%Creset %C(white)%s%Creset" --abbrev=7 '
alias gld='git_log_custom --graph --date=format:"%Y-%m-%d %H:%M:%S"'
alias gl='gld --date=relative'
alias gla='gld --date=relative --all'
alias glnc='git log --no-color'

# ls-files
alias glsu='git ls-files --others --exclude-standard'
alias glsi='git ls-files -oiX .gitignore'
