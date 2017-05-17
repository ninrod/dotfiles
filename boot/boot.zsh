#!/usr/bin/env zsh
# author: Filipe Silva (ninrod)

SCRIPTPATH=$(cd $(dirname $0); pwd -P) && cd $SCRIPTPATH
GIT_ROOT=$(git rev-parse --show-toplevel)

source $GIT_ROOT/boot/guard.zsh
source $GIT_ROOT/zsh/termcolors.zsh
source $GIT_ROOT/boot/functions.zsh
source $GIT_ROOT/zsh/constants.zsh
source $GIT_ROOT/boot/symlinks.zsh

source $GIT_ROOT/boot/options.zsh

source $GIT_ROOT/boot/ningrab.zsh $1
source $GIT_ROOT/boot/zsh-deps.zsh
source $GIT_ROOT/boot/vim-deps.zsh
source $GIT_ROOT/boot/emacs-deps.zsh
