#!/usr/bin/env zsh
# author: Filipe Silva (ninrod)

SCRIPTPATH=$(cd $(dirname $0); pwd -P) && cd $SCRIPTPATH
GIT_ROOT=$(git rev-parse --show-toplevel)

DIR=~/.config/sxhkd
FILE=sxhkdrc
FULL_FILE=$DIR/$FILE

[[ -e $FULL_FILE ]] && exit 0

if [[ ! -d $DIR ]]; then
  mkdir -p $DIR
fi
rm -f $FULL_FILE
ln -s $(readlink -f $FILE) $(readlink -f $FULL_FILE)
