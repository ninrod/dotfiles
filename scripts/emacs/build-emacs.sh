#!/usr/bin/env zsh

print $EMACS_SRC_DIR
builtin cd "$EMACS_SRC_DIR" &&
  make distclean &&
  make clean &&
  ./autogen.sh &&
  ./configure --with-ns &&
  make install
