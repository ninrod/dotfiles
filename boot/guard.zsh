#!/usr/bin/env bash

MY_COMMAND=readlink

if ! command -v $MY_COMMAND; then
   echo "$MY_COMMAND command not found. aborting."
   exit 1;
else
  echo "$MY_COMMAND was found, continuing"
fi