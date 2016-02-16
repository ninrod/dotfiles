#!/usr/local/bin/zsh

updatelinks() {
  #$1 : é o link simbólico
  #$2 : é a pasta local (target)

  # o switch -h testa se o argumento existe e é um link.
  if [[ -h $1 ]]; then
    print '"'$1'" symlink já existe. removendo...'
    rm $1
  fi

  print 'montando link simbólico "'$1'" -> "'${2:a}'"'
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

# oh-my-zsh
updatelinks ~/.oh-my-zsh .oh-my-zsh

# zplug
updatelinks ~/.zplug .zplug
