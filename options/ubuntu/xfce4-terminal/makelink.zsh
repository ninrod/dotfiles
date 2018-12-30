#!/usr/bin/env zsh
# author: Filipe Silva (ninrod)

SCRIPTPATH=$(cd $(dirname $0); pwd -P) && cd $SCRIPTPATH
GIT_ROOT=$(git rev-parse --show-toplevel)

DIR=~/.config/xfce4
LINK=~/.config/xfce4/terminal

if [[ -h $LINK ]]; then
  echo "já tem o link, nada mais a fazer"
  exit 0
else
  echo "o $LINK não existe, vamos avançar"
fi

if [[ ! -h $LINK ]] && [[ -d $LINK ]]; then
  echo "não existe o link, mas existe o diretório com o nome do link, removendo."
  rm -r $LINK
else
  echo "ou existe o link e portanto eu já removi, ou não existe o link em forma de diretório. skipping"
fi

if [[ ! -d $DIR ]]; then
  echo "o diretório $DIR não existe, vou criá-lo"
  mkdir -p $DIR
fi

ln -s $(readlink -f .) $(readlink -f $LINK)
