#!/usr/bin/env zsh
# author: Filipe Silva (ninrod)

SCRIPTPATH=$(cd $(dirname $0); pwd -P) && cd $SCRIPTPATH
GIT_ROOT=$(git rev-parse --show-toplevel)

echo $PWD

logdir=$GIT_ROOT/boot/log
mkdir -p $logdir

logfile=$logdir/boot.log

./boot/boot.zsh $1 2>&1 | tee $logfile
