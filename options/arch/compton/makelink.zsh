#!/usr/bin/env zsh
# author: Filipe Silva (ninrod)

SCRIPTPATH=$(cd $(dirname $0); pwd -P) && cd $SCRIPTPATH
GIT_ROOT=$(git rev-parse --show-toplevel)

FILE=compton.conf
FULL_FILE=~/.${FILE}

[[ -e $FULL_FILE ]] && exit 0

rm -f $FULL_FILE

ln -s $(readlink -f $FILE) $(readlink -f $FULL_FILE)

