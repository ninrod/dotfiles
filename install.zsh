#! /usr/bin/env zsh

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
# lib import {{{

GIT_ROOT=$(git rev-parse --show-toplevel)
. $GIT_ROOT/lib/import.sh

# }}}

# functions ------------
# ensure_options_file: ensure options_file exists {{{

ensure_options_file() {
  if [[ ! -d ~/.options ]]; then
    mkdir ~/.options
  fi

  local options_file="$(readlink -f ~/.options/shell-options.conf)"

  if [[ ! -e $options_file ]]; then
    cp conf/options/shell-options.conf ~/.options
  fi
}

# }}}
# ensure_dotpath: ensure $DOTPATH is set on $options_file {{{

ensure_dotpath() {
  ensure_options_file

  local options_file="$(readlink -f ~/.options/shell-options.conf)"
  local temp_file="$(readlink -f ~/.options/temp.conf)"

  # remove DOTPATH, if it exists
  awk '!/^DOTPATH/' $options_file > $temp_file && mv $temp_file $options_file

  # append $DOTPATH to $options_file
  echo "DOTPATH=$GIT_ROOT" >> $options_file
}

# }}}
# verifylink: ensure no regular user file will be overwritten {{{

verifylink() {
  local symlink=${1:a}

  if [[ -e $symlink ]] && [[ ! -h $symlink ]]; then
    echo -e "${Yellow}$symlink${Rst} is a ${Red}regular${Rst} file on your system."
    echo -e "rename/backup the file ${Yellow}$symlink${Rst}, and run the script again."
    exit 1
  fi
}

# }}}
# updatelinks: help with symlinkage {{{

updatelinks() {
  local symlink=${1:a}
  local symlink_old_target=${1:A}
  local symlink_new_target=${2:A}

  if [[ ! -h $symlink ]]; then
    echo -e "$symlink ${Green}->${Rst} $symlink_new_target"
  elif [[ $symlink_old_target != $symlink_new_target ]]; then
    rm $symlink
    echo -e "$1 ${Red}-${Black}X${Rst}->${Rst} $symlink ${Green}->${Rst} $symlink_new_target"
  else
    echo -e "$1 ${Green}ok.${Rst}"
    return 0
  fi

  ln -s $symlink_new_target $symlink
}

# }}}
# ensure_vim_plugins: ensure vim plugins are installed {{{

ensure_vim_plugins() {
  local plug_dir=$(readlink -m ~/.vim/plugged)
  if [[ ! -d $plug_dir ]]; then
    echo -e "installing ${Yellow}vim${Rst} plugins..."
    vim +PlugInstall +qall
  fi
}

# }}}
# apply_git_info: apply git information  {{{

# if available through environment variables
apply_git_info() {
  if [[ -n ${GIT_BCB_NAME+x} ]]; then
    git config --global user.name "$GIT_BCB_NAME"
  fi
  if [[ -n ${GIT_BCB_EMAIL+x} ]]; then
    git config --global user.email "$GIT_BCB_EMAIL"
  fi
}

# }}}
# clonedep: smarter clones {{{
clonedep() {
  local name="$1"
  local url="$2"
  if [[ ! -d $name ]]; then
    echo -e "dependency ${Red}${name}${Rst} was not cloned. cloning now."
    git clone $url $name
    echo -e "dependency ${Yellow}${name}${Rst} cloned."
  else
    echo -e "dependency ${Green}${name}${Rst} already cloned."
  fi
}
# }}}

# cloning deps {{{

DEPS_DIR=$GIT_ROOT/deps
if [[ ! -d $DEPS_DIR ]]; then
  mkdir $DEPS_DIR
fi
cd $DEPS_DIR

clonedep nin-vi-mode http://github.com/ninrod/nin-vi-mode.git
clonedep docker-alias http://github.com/ninrod/docker-alias.git

# }}}

cd $GIT_ROOT

setopt extended_glob

for file in dot/^*.cp; do
  verifylink ~/.${file:t}
done

for file in dot/^*.cp; do
  updatelinks ~/.${file:t} $file
done

# TODO make this function backup user files to $SCRIPTPATH/tmp/bkp, if applicable
for file in dot/*.cp; do
  cp $file ~/.${file:t:r}
done

ensure_dotpath
ensure_vim_plugins
apply_git_info
