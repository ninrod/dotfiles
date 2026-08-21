#!/usr/bin/env zsh
# author: Filipe Silva (ninrod)

# eu chamei de dont_makelink para que o script de autosymlink não carregue esse cara automaticamente

SCRIPTPATH=$(cd $(dirname $0); pwd -P) && cd $SCRIPTPATH
GIT_ROOT=$(git rev-parse --show-toplevel)

SYMLINK=/usr/local/bin/idea
TARGET=~/.options/wsl/scripts/idea/idea.sh

if [[ -e $SYMLINK ]]; then
  rm $SYMLINK
fi

echo "criando $TARGET symlink $SYMLINK"
sudo ln -s $(realpath $TARGET) $SYMLINK
