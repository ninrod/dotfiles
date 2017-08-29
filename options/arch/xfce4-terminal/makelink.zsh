#!/usr/bin/env zsh
# author: Filipe Silva (ninrod)

SCRIPTPATH=$(cd $(dirname $0); pwd -P) && cd $SCRIPTPATH
GIT_ROOT=$(git rev-parse --show-toplevel)

DIR=~/.config/xfce4
LINK=~/.config/xfce4/terminal

[[ -h $LINK ]] && exit 0

if [[ ! -h $LINK ]] && [[ -d $LINK ]]; then
  rm -r $LINK
fi

if [[ ! -d $DIR ]]; then
  mdkir -p $DIR
fi

ln -s $(readlink -f .) $(readlink -f $LINK)
