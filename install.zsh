#!/usr/bin/env zsh

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

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P  )"
cd $SCRIPTPATH
. $SCRIPTPATH/lib/import.sh

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
  echo "DOTPATH=${GIT_ROOT/$HOME/~}" >> $options_file
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
  local ref="$3"
  echo ""
  echo -e "-------------------"
  if [[ ! -d $name ]]; then
    echo -e "[${Red}${name}${Rst}] not cloned. cloning now."
    if [[ -n ${3+x} ]]; then
      local clone_depth=${4:-400}
      if [[ -n ${4+x} ]]; then
        echo -e "a clone depth ${Blue}${4}${Rst} was passed. cloning deeper"
        git clone --depth $clone_depth $url $name
      else
        echo -e "No depth arg passed. Performing ${Blue}full${Rst} clone."
        git clone $url $name
      fi
      local cwd=$(readlink -f .)
      cd $name
      git checkout --quiet $ref
      git branch --no-color --quiet --column=dense
      cd $cwd
    else
      echo -e "no ref to checkout. ${Yellow}shallow${Rst} cloning."
      git clone --depth 1 $url $name
    fi
    echo -e "[${Green}${name}${Rst}] sucessfully cloned."
  else
    echo -e "[${Green}${name}${Rst}] already cloned."
  fi
  echo -e "-------------------"
}

# }}}

# dependency fetch {{{

DEPS_DIR=$GIT_ROOT/deps
if [[ ! -d $DEPS_DIR ]]; then
  mkdir $DEPS_DIR
fi
cd $DEPS_DIR

# zplug itself
clonedep zplug/zplug https://github.com/zplug/zplug.git 2.1.0 100

# fuzzy filter
clonedep junegunn/fzf https://github.com/junegunn/fzf.git 0.13.3 100

# in test: rupa/z async branch
# clonedep rupa/z https://github.com/rupa/z.git
clonedep rupa/z https://github.com/rupa/z.git async

# zplug deps
clonedep Tarrasch/zsh-bd                   https://github.com/Tarrasch/zsh-bd.git
clonedep b4b4r07/enhancd                   https://github.com/b4b4r07/enhancd.git
clonedep ninrod/docker-zsh-completion      https://github.com/ninrod/docker-zsh-completion.git
clonedep ninrod/docker-alias               https://github.com/ninrod/docker-alias.git
clonedep ninrod/nin-vi-mode                https://github.com/ninrod/nin-vi-mode.git
clonedep supercrabtree/k                   https://github.com/supercrabtree/k.git
clonedep zsh-users/zsh-completions         https://github.com/zsh-users/zsh-completions.git
clonedep zsh-users/zsh-syntax-highlighting https://github.com/zsh-users/zsh-syntax-highlighting.git

echo ""

cd $DEPS_DIR

# }}}
# extra adjustments for .fzf and .zplug {{{

verifylink ~/.fzf
verifylink ~/.zplug

updatelinks ~/.fzf junegunn/fzf
updatelinks ~/.zplug zplug/zplug

# }}}

setopt extended_glob

cd $GIT_ROOT

# FIXME: is there a bash way to do this?
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

cd $GIT_ROOT

# extra install step for fzf
echo ""
echo "------------------"
cd ~/.fzf
./install --no-update-rc --completion --key-bindings
