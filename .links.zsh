#!/usr/local/bin/zsh

update_theme_dir() {
  # -d testa se o parâmetro existe e se é um diretório
  if [[ ! -d $1 ]]; then
    print 'o diretório "'$1'" não existe. criando...'
    mkdir $1
  else
    print 'o diretório "'$1'" já existe.'
  fi
}

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

# omz plugins
updatelinks ~/.oh-my-zsh/custom/plugins/nin-vi-mode oh-my-zsh-extras/nin-vi-mode
updatelinks ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting oh-my-zsh-extras/zsh-syntax-highlighting
updatelinks ~/.oh-my-zsh/custom/plugins/zsh-bd oh-my-zsh-extras/zsh-bd

# omz themes
update_theme_dir ~/.oh-my-zsh/custom/themes
updatelinks ~/.oh-my-zsh/custom/themes/powerlevel9k oh-my-zsh-extras/powerlevel9k
