#!/usr/bin/env zsh

# from an amazing reference taken from arch wiki on locate:
# https://jvns.ca/blog/2015/03/05/how-the-locate-command-works-and-lets-rewrite-it-in-one-minute/

# first step: sudo find / > ~/.file_db.txt (~37MB on my system)

if [[ -z ${1+x} ]]; then
  print no argument given, exiting
  exit 0
fi

ag $@ ~/.file_db.txt

