#!/usr/bin/env zsh
# author: Filipe Silva (ninrod)

SCRIPTPATH=$(cd $(dirname $0); pwd -P) && cd $SCRIPTPATH
GIT_ROOT=$(git rev-parse --show-toplevel)

SYMLINK=/usr/local/bin/idea
TARGET=./idea.sh

if [[ -e $SYMLINK ]]; then
  rm $SYMLINK
fi

echo "criando $TARGET symlink $SYMLINK"
sudo ln -s $(realpath $TARGET) $SYMLINK
