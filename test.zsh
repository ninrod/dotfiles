#!/usr/local/bin/zsh

vimfolder=~/.vim
target=.vim(:a)
# verificando se o link simbólico da pasta ~/.vim já está montado.
if [[ -h $vimfolder ]]; then
  print '"'$vimfolder'" já existe.'
else
  print 'montando link simbólico "'$vimfolder'" -> "'$target'"'
  ln -s .vim(:a) ~/.vim
fi

# ln -s .vimrc(:a) ~/.vimrc

# # config do oh-my-zsh
# ln -s .oh-my-zsh(:a) ~/.oh-my-zsh

# # config do shell zsh
# ln -s .zshrc(:a) ~/.zshrc

# # config do tmux
# ln -s .tmux.conf(:a) ~/.tmux.conf

# # config do git
# ln -s .gitconfig(:a) ~/.gitconfig

# # config do Ag (the silver searcher)
# ln -s .agignore(:a) ~/.agignore

# # config de cores do comando ls
# ln -s .dircolors/dircolors.256dark(:a) ~/.lscolors

# # config de plugins do oh-my-zsh
# ln -s oh-my-zsh-extras/nin-vi-mode(:a) ~/.oh-my-zsh/custom/plugins/nin-vi-mode
# ln -s oh-my-zsh-extras/zsh-syntax-highlighting(:a) ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# # config de temas do oh-my-zsh
# mkdir ~/.oh-my-zsh/custom/themes
# ln -s oh-my-zsh-extras/powerlevel9k(:a) ~/.oh-my-zsh/custom/themes/powerlevel9k