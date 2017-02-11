#!/usr/bin/env zsh

print $EMACS_SRC_DIR
builtin cd "$EMACS_SRC_DIR" &&
  ./autogen.sh &&
  make maintainer-clean &&
  ./configure --with-ns &&
  make install
