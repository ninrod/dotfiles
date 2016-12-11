#!/usr/bin/env zsh

print "building vim from $VIM_SRC_DIR"

builtin cd $VIM_SRC_DIR &&
  git clean -fd &&
  make distclean &&
  make clean &&
./configure --prefix=/usr --with-features=huge --enable-multibyte &&
  make -j9 &&
  sudo make install