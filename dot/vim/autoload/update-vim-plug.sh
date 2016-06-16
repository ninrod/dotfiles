#! /usr/bin/env sh

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P  )"
cd $SCRIPTPATH

curl -fLo plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
