#!/usr/bin/env zsh
# author: Filipe Silva (ninrod)

# initial setup
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P  )"
cd $SCRIPTPATH
GIT_ROOT=$(git rev-parse --show-toplevel)
source $GIT_ROOT/zsh/termcolors.zsh
source $GIT_ROOT/misc/install/functions.zsh

# fetch zsh deps
deps=$GIT_ROOT/deps
mkdir -p $deps
cd $deps

clonedep Tarrasch/zsh-bd                   https://github.com/Tarrasch/zsh-bd.git
clonedep supercrabtree/k                   https://github.com/supercrabtree/k.git
clonedep ninrod/docker-zsh-completion      https://github.com/ninrod/docker-zsh-completion.git
clonedep zsh-users/zsh-completions         https://github.com/zsh-users/zsh-completions.git
clonedep zsh-users/zsh-syntax-highlighting https://github.com/zsh-users/zsh-syntax-highlighting.git
clonedep rupa/z                            https://github.com/rupa/z.git

# fetch vim deps
plugged=$GIT_ROOT/vim/plugged
mkdir -p $plugged
cd $plugged

clonedep morhetz/gruvbox                https://github.com/morhetz/gruvbox.git
clonedep itchyny/lightline.vim          https://github.com/itchyny/lightline.vim.git
clonedep edkolev/tmuxline.vim           https://github.com/edkolev/tmuxline.vim.git
clonedep bronson/vim-visual-star-search https://github.com/bronson/vim-visual-star-search.git
clonedep chaoren/vim-wordmotion         https://github.com/chaoren/vim-wordmotion.git
clonedep ervandew/supertab              https://github.com/ervandew/supertab.git
clonedep jiangmiao/auto-pairs           https://github.com/jiangmiao/auto-pairs.git
clonedep junegunn/vim-easy-align        https://github.com/junegunn/vim-easy-align.git
clonedep luochen1990/rainbow            https://github.com/luochen1990/rainbow.git
clonedep ninrod/vim-multiple-cursors    https://github.com/ninrod/vim-multiple-cursors.git
clonedep tommcdo/vim-exchange           https://github.com/tommcdo/vim-exchange.git
clonedep tpope/vim-commentary           https://github.com/tpope/vim-commentary.git
clonedep tpope/vim-repeat               https://github.com/tpope/vim-repeat.git
clonedep tpope/vim-surround             https://github.com/tpope/vim-surround.git
clonedep wellle/targets.vim             https://github.com/wellle/targets.vim.git

# apply symlinks
cd $GIT_ROOT

for file in symlinks/*.symlink; do
  verifylink ~/.${file:t:r}
done
for file in symlinks/*.symlink; do
  updatelinks ~/.${file:t:r} $file
done

# TODO make this function backup user files to $SCRIPTPATH/tmp/bkp, if applicable
for file in symlinks/*.copy; do
  cp $file ~/.${file:t:r}
done

ensure_dotpath
ensure_vim_plugins
apply_git_info
