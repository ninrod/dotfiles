#!/usr/bin/env zsh
# author: Filipe Silva (ninrod)

SCRIPTPATH=$(cd $(dirname $0); pwd -P) && cd $SCRIPTPATH
GIT_ROOT=$(git rev-parse --show-toplevel)

LINK=~/.config/yay

[[ -h $LINK ]] && exit 0

if [[ ! -h $LINK ]] && [[ -d $LINK ]]; then
  rm -r $LINK
fi

ln -s $(realpath .) $(realpath $LINK)
