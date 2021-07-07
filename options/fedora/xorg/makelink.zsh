#!/usr/bin/env zsh
# author: Filipe Silva (ninrod)

SCRIPTPATH=$(cd $(dirname $0); pwd -P) && cd $SCRIPTPATH
GIT_ROOT=$(git rev-parse --show-toplevel)

update_link() {
  local file=$1
  local deploy=$2
  [[ -e $deploy ]] && return 0
  ln -sf $(readlink -f $file) $deploy
}

update_link Xmodmap.xorg ~/.Xmodmap
