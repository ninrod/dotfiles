#!/usr/bin/env zsh
# author: Filipe Silva (ninrod)

SCRIPTPATH=$(cd $(dirname $0); pwd -P) && cd $SCRIPTPATH
GIT_ROOT=$(git rev-parse --show-toplevel)
source $GIT_ROOT/zsh/termcolors.zsh

if ! emacsclient.sh -e "(ignore)" > /dev/null 2>&1; then
  echo -e "emacs daemon is already ${Green}killed${Rst}, nothing to do."
  exit 0
fi

echo -e "emacs daemon is ${Yellow}up${Rst}. Let us ${Red}kill${Rst} it..."

emacsclient.sh -e "(kill-emacs)"; rc=$?
if [[ ! $rc = 0 ]]; then
  echo -e "there was a ${Red}problem${Rst} killing emacs server: $rc"
  exit $rc
fi

echo -e "emacs daemon was successfully ${Red}killed${Rst}."