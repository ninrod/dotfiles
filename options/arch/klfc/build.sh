#!/usr/bin/env bash

SCRIPTPATH=$(cd $(dirname $0); pwd -P) && cd $SCRIPTPATH

DIST=dist
rm -rf $DIST
mkdir -p $DIST
klfc --from-json qwerty.json deadkeys.json --xkb $DIST
