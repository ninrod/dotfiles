#!/usr/bin/env zsh
# author: Filipe Silva (ninrod)

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P)" && cd $SCRIPTPATH
GIT_ROOT=$(git rev-parse --show-toplevel)

source $GIT_ROOT/zsh/termcolors.zsh
source $GIT_ROOT/boot/functions.zsh

# source custom giturl definitions, if applicable
url_hash_file=~/.options/urlhash.zsh
if [[ -e $url_hash_file ]]; then
  typeset -A urlhash
  source $url_hash_file
fi

source $GIT_ROOT/boot/zsh-deps.zsh
source $GIT_ROOT/boot/vim-deps.zsh
source $GIT_ROOT/boot/symlinks.zsh

ensure_dotpath
apply_git_info
