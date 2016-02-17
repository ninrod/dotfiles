#!/usr/local/bin/zsh

# helper function to manage symlinks.
updatelinks() {
  #$1 is the symlink
  #$2 is the target

  # the `-h` switch tests if the argument exists and is a symlink.
  if [[ -h $1 ]]; then
    print '"'$1'" found existing symlink. removing.'
    rm $1
  fi

  print 'mounting symlink "'$1'" -> "'${2:a}'"'
  ln -s ${2:a} $1
}

# vim
updatelinks ~/.vim symlinks/.vim
updatelinks ~/.vimrc symlinks/.vimrc

# tmux
updatelinks ~/.tmux.conf symlinks/.tmux.conf

# git
updatelinks ~/.gitconfig symlinks/.gitconfig

# ag (Ag - the silver searcher)
updatelinks ~/.agignore symlinks/.agignore

# colors for ls
updatelinks ~/.lscolors symlinks/.dircolors/dircolors.256dark

# zsh
updatelinks ~/.zshrc symlinks/.zshrc

# zplug
updatelinks ~/.zplug symlinks/.zplug
updatelinks ~/.zsh-plugins zsh-plugins
