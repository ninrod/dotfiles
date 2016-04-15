#!/usr/local/bin/zsh

# Author: Filipe Silva (ninrod)
# License: Same as VIM.

# helper function to manage symlinks.
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

updatelinks ~/.zplug dot/.zplug
updatelinks ~/.vim dot/.vim
updatelinks ~/.vimrc dot/.vimrc
updatelinks ~/.zshrc dot/.zshrc
updatelinks ~/.bashrc dot/.bashrc
updatelinks ~/.bash_profile dot/.bash_profile
updatelinks ~/.tmux.conf dot/.tmux.conf
updatelinks ~/.lscolors dot/.dircolors/dircolors.256dark
updatelinks ~/.gitconfig dot/.gitconfig
updatelinks ~/.agignore dot/.agignore
updatelinks ~/.fzf deps/fzf
