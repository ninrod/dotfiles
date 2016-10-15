#!/bin/sh

cd $VIM_SRC_DIR
./configure --prefix=/usr --with-features=huge --enable-multibyte && make && make install
