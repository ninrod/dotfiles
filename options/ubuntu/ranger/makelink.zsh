#!/usr/bin/env zsh
# author: Filipe Silva (ninrod)

SCRIPTPATH=$(cd $(dirname $0); pwd -P) && cd $SCRIPTPATH
GIT_ROOT=$(git rev-parse --show-toplevel)

DIR=~/.config/ranger
TARGET=.

if [[ -d $DIR ]]; then
  rm -rf $DIR
else
  rm -f $DIR
fi

ln -s $(readlink -f $TARGET) $DIR
