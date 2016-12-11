#!/usr/bin/env zsh

print "building zsh from $ZSH_SRC_DIR"

builtin cd "$ZSH_SRC_DIR" &&
  git clean -fd &&
  make distclean &&
  make clean &&
  ./Util/preconfig &&
  ./configure &&
  make -j9 &&
  make check &&
  sudo make install