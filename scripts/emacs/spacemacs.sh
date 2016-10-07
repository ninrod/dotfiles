#!/bin/sh

# author: ninrod

##### documentation ######
# How to maintain a separate spacemacs installation that lives alongside your own custom ~/.emacs.d
# 
# * note: hack lifted from http://emacs.stackexchange.com/a/19980/12585
#
# * steps:
#
#   a. basically, setup a folder (let's say, ~/Dropbox/spacemacs) that has to have:
#     1. the git cloned emacs.d spacemacs directory
#     2. a .emacs.d symlink pointing to the aforementioned gitcloned spacemacs folder
#     3. a .spacemacs.d folder (or symlink) with your custom spacemacs configuration (~/.spacemacs.d/init.el)
#
#   b. with that out of the way, just set up the HOME var pointing to the setup folder and call emacs.

HOME=~/Dropbox/spacemacs emacs
