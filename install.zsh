#! /usr/bin/env zsh

# Author: Filipe Silva (ninrod)
# License: Same as VIM.

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

# function to remove file, if applicable. {{{
removeifexists() {
  # the `-f` switch tests if the argument exists and is a regular file
  if [[ -f $1 ]]; then
    print '"'$1'" found existing file. removing.'
    rm $1
  fi
}
# }}}

# function to ensure options_file exists {{{
ensure_options_file() {
  if [[ ! -d ~/.options ]]; then
    mkdir ~/.options
  fi

  local options_file="$(realpath ~/.options/shell-options.conf)"

  if [[ ! -e $options_file ]]; then
    touch $options_file
    echo "#GIT_USER_NAME=" >> $options_file
    echo "#GIT_USER_EMAIL=" >> $options_file
  fi
}
# }}}

# function to ensure $DOTPATH is set on $options_file {{{
ensure_dotpath() {
  ensure_options_file

  local options_file="$(realpath ~/.options/shell-options.conf)"
  local temp_file="$(realpath ~/.options/temp.conf)"

  # remove DOTPATH, if it exists
  awk '!/^DOTPATH/' $options_file > $temp_file && mv $temp_file $options_file

  # append $DOTPATH to $options_file
  local dotpath="$( cd "$(dirname "$0")" ; pwd -P  )"
  echo "DOTPATH=$dotpath" >> $options_file
}
# }}}

# function to help with symlinkage {{{
updatelinks() {
  local symlink=${1:a}
  local symlink_old_target=${1:A}
  local symlink_new_target=${2:A}

  if [[ -e $symlink ]] && [[ ! -h $symlink ]]; then
    echo -e "$symlink is a ${Red}regular${Rst} file. backup the file and run the script again."
    return 1
  fi

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

# setting up symlinks {{{

# vim, zsh and tmux
updatelinks ~/.vim dot/vim
updatelinks ~/.vimrc dot/vimrc
updatelinks ~/.zshrc dot/zshrc
updatelinks ~/.tmux.conf dot/tmux.conf

# bash
updatelinks ~/.bashrc dot/bashrc
updatelinks ~/.bash_profile dot/bash_profile

# neovim
updatelinks ~/.config dot/config

# colors for ls
updatelinks ~/.lscolors dot/dircolors/dircolors.256dark

# ag (the silver searcher)
updatelinks ~/.agignore dot/agignore

# }}}

# git
cp dot/gitconfig ~/.gitconfig

# ensure $DOTPATH is set. $DOTPATH is the directory where the dotfiles repo was cloned.
ensure_dotpath
