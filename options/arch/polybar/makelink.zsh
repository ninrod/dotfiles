#!/usr/bin/env zsh
# author: Filipe Silva (ninrod)

SCRIPTPATH=$(cd $(dirname $0); pwd -P) && cd $SCRIPTPATH
GIT_ROOT=$(git rev-parse --show-toplevel)

DIR=~/.config/polybar
FILE=gruvbox.conf
LAUNCHER=launch.sh
SYMLINK=$DIR/config
FULL_LAUNCHER=$DIR/$LAUNCHER

rm -rf $DIR
mkdir -p $DIR

ln -sf $(readlink -f $FILE) $(readlink -f $SYMLINK)
ln -sf $(readlink -f $LAUNCHER) $(readlink -f $FULL_LAUNCHER)
