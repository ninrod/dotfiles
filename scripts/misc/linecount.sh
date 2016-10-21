#!/bin/sh

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P)" && cd $SCRIPTPATH
GIT_ROOT=$(git rev-parse --show-toplevel) && cd $GIT_ROOT

ag -l | xargs wc -l | sort -n

