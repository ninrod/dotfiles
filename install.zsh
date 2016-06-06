#! /bin/zsh

# Author: Filipe Silva (ninrod)
# License: Same as VIM.

# function to ensure that $DOTPATH is set on $options_file
setdotpath() {
  local option_file="$(realpath ~/.options/shell-options.conf)"
  if grep -q '^DOTPATH=' $option_file; then
    # dotpath is set. no need to do anything
    return 0
  fi

  # dotpath is not set. appending $DOTPATH to $options_file
  local dotpath="$( cd "$(dirname "$0")" ; pwd -P  )"
  echo "DOTPATH=$dotpath" >> $option_file
}

# helper function to manage linkage.
updatelinks() {
  #$1 is the symlink
  #$2 is the target

  # the `-h` switch tests if the argument exists and is a symlink.
  if [[ -h $1 ]]; then
    print '"'$1'" found existing symlink. removing.'
    rm $1
  fi

  print -l 'mounting symlink "'$1'" -> "'${2:a}'"'
  ln -s ${2:a} $1
}

# vim, zsh and tmux
updatelinks ~/.vim dot/vim
updatelinks ~/.vimrc dot/vimrc
updatelinks ~/.zshrc dot/zshrc
updatelinks ~/.tmux.conf dot/tmux.conf

# neovim
updatelinks ~/.config dot/config

# colors for ls
updatelinks ~/.lscolors dot/dircolors/dircolors.256dark

# bash
updatelinks ~/.bashrc dot/bashrc
updatelinks ~/.bash_profile dot/bash_profile

# git
cp dot/gitconfig ~/.gitconfig

# ag (the silver searcher)
updatelinks ~/.agignore dot/agignore

# ensure $DOTPATH is set.
# $DOTPATH is the directory where the dotfiles repo was cloned.
setdotpath
