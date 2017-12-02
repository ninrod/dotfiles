#!/usr/bin/env bash

# tip: compiling with lucid
# https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=emacs-lucid

git clean -fd
make maintainer-clean
./autogen.sh
./configure
make
sudo make install
