#!/usr/bin/env zsh

# author: Filipe Silva (ninrod)

SCRIPTPATH=$(cd $(dirname $0); pwd -P) && cd $SCRIPTPATH
GIT_ROOT=$(git rev-parse --show-toplevel)
source $GIT_ROOT/zsh/termcolors.zsh

if emacsclient.sh -e "(ignore)" > /dev/null 2>&1; then
  echo -e "emacs daemon is already ${Green}up${Rst}, nothing to do."
  exit 0
else
  echo -e "emacs daemon is ${Red}killed${Rst}. Let us ${Green}ressurect${Rst} it..."
fi

emacs.sh --daemon; rc=$?
if [[ $rc = 0 ]]; then
  echo -e "emacs daemon ${Blue}started${Rst}. success."
else
  echo -e "there was a ${Red}problem${Rst} starting emacs daemon: $rc"
fi
