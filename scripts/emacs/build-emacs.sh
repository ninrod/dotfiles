#!/usr/bin/env zsh

print $EMACS_SRC_DIR

# compiling with lucid
# https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=emacs-lucid
builtin cd "$EMACS_SRC_DIR" &&
  git clean -fd &&
  make maintainer-clean &&
  ./autogen.sh &&
- ./configure --with-x-toolkit=lucid --with-xft --with-libotf --with-m17n-flt &&
  make &&
  sudo make install

