#!/usr/bin/env zsh

print $EMACS_SRC_DIR
builtin cd "$EMACS_SRC_DIR" && make distclean && make clean
git checkout emacs-25.1 && ./autogen.sh && ./configure --with-ns && make install
