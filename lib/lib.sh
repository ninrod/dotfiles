#! /bin/sh

# author: Filipe Silva (ninrod)
# LICENSE and COPYRIGHT notice {{{

# ninrod's dotfiles - sharpened dotfiles for zsh, vim, tmux and friends.
# Copyright (C) 2016 Filipe Silva (ninrod)

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# }}}

# terminal colors {{{

TC='\e['
Rst="${TC}0m"
Black="${TC}30m";
Red="${TC}31m";
Green="${TC}32m";
Yellow="${TC}33m";
Blue="${TC}34m";
Purple="${TC}35m";
Cyan="${TC}36m";
White="${TC}37m";

# }}}
# CONSTANTS {{{

GIT_ROOT=$(git rev-parse --show-toplevel)

# }}}

#  functions -------------------------------
# fix_script_path {{{

fix_script_path() {
  local script_path="$( cd "$(dirname "$0")" ; pwd -P )"
  cd $script_path
}

# }}}
# ensure_container_running {{{

# use: ensure_container_running [container] [script_that_runs_the_container]
ensure_container_running() {
  local is_container_running=$(docker ps --filter=name=${1} --filter=status=running | grep ${1})
  if [[ -z ${is_container_running// } ]]; then
    echo -e "The container $Red $1 $Rst is not running. bringing it up now."
    bash -c "$2"
  else
    echo -e "container ${Green}${1}${Rst} found."
  fi
}

# }}}
# killcontainer: kills an executing container {{{

# use: killcontainer [container_name]
killcontainer() {
  if [[ -z $1 ]]; then
    echo -e "$Red no argument passed. exiting killcontainer function."
    echo -e "$Red fuck"
    return 0
  fi
  echo -e "killing container ${Red}${1}${Rst} if it is executing"
  docker ps --filter="name=$1" \
    --filter="status=running" -aq | \
    xargs --no-run-if-empty -I{} bash -c \
    "echo -e \"containerid $Purple{}$Rst encontrado. \"; \
    docker kill {}; \
    echo -e \"container $Purple{}$Rst foi morto.\";"
}

# }}}
# removecontainer: remove stoped containers {{{

# use: removecontainer [container_name]
removecontainer() {
  echo -e "remove container ${Red}${1}${Rst}, if it exists."
  docker ps --filter="name=$1" -aq | \
    xargs --no-run-if-empty -I{} bash -c \
    "echo -e \"containerid ${Purple}{}${Rst} found. removing.\"; \
    docker rm {}; \
    echo -e \"container ${Purple}{}${Rst} was removed.\""
}

# }}}
# blast_container: kills and then removes a running container {{{

# use: blastcontainer [container_name]
blastcontainer() {
  killcontainer $1
  removecontainer $1
}

# }}}
