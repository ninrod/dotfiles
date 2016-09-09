#!/bin/sh

cd $EMACS_SRC_DIR
./configure --with-ns
make install
