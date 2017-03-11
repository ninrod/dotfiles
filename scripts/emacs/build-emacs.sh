#!/usr/bin/env zsh

print $EMACS_SRC_DIR
builtin cd "$EMACS_SRC_DIR" &&
  git clean -fd &&
  make maintainer-clean &&
  ./autogen.sh &&
  ./configure --with-ns &&
  make install
