alias xclip="xclip -selection c"
alias bat="sudo tlp stat | tail -9"
alias pdf="evince"
alias open=xdg-open
alias mpdcli='ncmpcpp -b ~/.config/ncmpcpp/bindings.conf'
alias locate='~/.options/arch/scripts/mylocate.zsh'

alias nj='sudo netctl stop-all; sudo netctl start juliforever'
alias nm='sudo netctl stop-all; sudo netctl start motorola'

function warsaw-browser {
  xhost +
  docker run -it --rm                                              \
         -e DISPLAY=unix$DISPLAY                                   \
         -v /tmp/.X11-unix:/tmp/.X11-unix                          \
         -v $(readlink -f .):/opt/assets                           \
         -v /dev/shm --tmpfs /dev/shm:rw,nosuid,nodev,exec,size=4g \
         --name warsaw-browser                                     \
         -w /opt/assets                                            \
         lichti/warsaw-browser bb
}
alias bb="warsaw-browser bb"
