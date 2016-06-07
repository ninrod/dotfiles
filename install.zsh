#! /bin/zsh

# Author: Filipe Silva (ninrod)
# License: Same as VIM.

# ensure options_file exists
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

# ensure $DOTPATH is set on $options_file
setdotpath() {
  ensure_options_file

  local options_file="$(realpath ~/.options/shell-options.conf)"
  local temp_file="$(realpath ~/.options/temp.conf)"

  # remove DOTPATH, if it exists
  awk '!/^DOTPATH/' $options_file > $temp_file && mv $temp_file $options_file

  # append $DOTPATH to $options_file
  local dotpath="$( cd "$(dirname "$0")" ; pwd -P  )"
  echo "DOTPATH=$dotpath" >> $options_file
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

# ensure $DOTPATH is set. $DOTPATH is the directory where the dotfiles repo was cloned.
setdotpath

# reload zsh
exec zsh
