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
updatelinks ~/.vim .vim
updatelinks ~/.vimrc .vimrc

# tmux
updatelinks ~/.tmux.conf .tmux.conf

# git
updatelinks ~/.gitconfig .gitconfig

# ag (Ag - the silver searcher)
updatelinks ~/.agignore .agignore

# comando ls
updatelinks ~/.lscolors .dircolors/dircolors.256dark

# zsh
updatelinks ~/.zshrc .zshrc

# zplug
updatelinks ~/.zplug .zplug
updatelinks ~/.zsh-plugins zsh-plugins
