#!/usr/bin/env bash

# from: http://stackoverflow.com/a/12495234/4921402
find . -mindepth 1 -maxdepth 1 -type d -print -exec git -C {} fetch \;