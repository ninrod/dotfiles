alias xclip="xclip -selection c"
alias bat="sudo tlp stat | tail -9"
alias pdf="evince"
alias open=xdg-open
alias mpdcli='ncmpcpp -b ~/.config/ncmpcpp/bindings.conf'

alias nj='sudo netctl stop-all; sudo netctl start juliforever'
alias ns='sudo netctl stop-all; sudo netctl start s8'

warsaw-browser() {
  xhost +
  docker run -it --rm                     \
         -e DISPLAY=unix$DISPLAY          \
         -v /tmp/.X11-unix:/tmp/.X11-unix \
         -v $(readlink -f .):/opt/assets  \
         --shm-size 2g                    \
         --name warsaw-browser            \
         -w /opt/assets                   \
         lichti/warsaw-browser bb
}
alias bb="warsaw-browser bb"


# conda
alias sa='source activate'
alias sd='source deactivate'
