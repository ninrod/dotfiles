# pacman

alias pmfs='pacman -Fs'        # query file database for a command
alias pmss='pacman -Ss'        # search for packages
alias pmqm='pacman -Qm'        # list foreign, manually installed (often means aur packages)
alias pmquent='pacman -Qent'   # list all explicit installed packages
alias pmqmdt='pacman -Qmdt'    # foreign and orphans and installted as deps
alias pms='sudo pacman -S'     # install
alias pmsyu='sudo pacman -Syu' # update
alias pmr='sudo pacman -R'     # remove
alias pm='sudo pacman'         # sudo pacman

# conda
alias sa='source activate'
alias sd='source deactivate'

# random
alias xclip="xclip -selection c"
alias bat="sudo tlp stat -b"
alias pdf="evince"
alias open=xdg-open
alias mpdcli='ncmpcpp -b ~/.config/ncmpcpp/bindings.conf'

# netctl
alias nj='sudo netctl stop-all; sudo netctl start juliforever'
alias ns='sudo netctl stop-all; sudo netctl start s8'
alias nb='sudo netctl stop-all; sudo netctl start bcbWifi'


# scripts
alias bssh="~/.options/arch/scripts/terminal/bssh.sh"
