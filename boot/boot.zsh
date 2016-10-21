#!/usr/bin/env zsh
# author: Filipe Silva (ninrod)

# initial setup
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P  )"
cd $SCRIPTPATH
GIT_ROOT=$(git rev-parse --show-toplevel)
source $GIT_ROOT/zsh/termcolors.zsh
source $GIT_ROOT/boot/functions.zsh

# source custom giturl definitions, if applicable
hash_options=~/.options/hashdeps.zsh
if [[ -e $hash_options ]]; then
  typeset -A hashdeps
  source $hash_options
fi

# fetch zsh deps
deps=$GIT_ROOT/deps
mkdir -p $deps && cd $deps

clonedep Tarrasch/zsh-bd                   
clonedep supercrabtree/k                   
clonedep ninrod/docker-zsh-completion      
clonedep zsh-users/zsh-completions         
clonedep zsh-users/zsh-syntax-highlighting 
clonedep rupa/z                            

# fetch vim deps
plugged=$GIT_ROOT/vim/plugged
mkdir -p $plugged && cd $plugged

clonedep morhetz/gruvbox                
clonedep itchyny/lightline.vim          
clonedep edkolev/tmuxline.vim           
clonedep bronson/vim-visual-star-search 
clonedep chaoren/vim-wordmotion         
clonedep ervandew/supertab              
clonedep jiangmiao/auto-pairs           
clonedep junegunn/vim-easy-align        
clonedep luochen1990/rainbow            
clonedep ninrod/vim-multiple-cursors    
clonedep tommcdo/vim-exchange           
clonedep tpope/vim-commentary           
clonedep tpope/vim-repeat               
clonedep tpope/vim-surround             
clonedep wellle/targets.vim             

# apply symlinks

cd $GIT_ROOT
for file in symlinks/*.symlink; do
  verifylink ~/.${file:t:r}
done
for file in symlinks/*.symlink; do
  updatelinks ~/.${file:t:r} $file
done
for file in symlinks/*.copy; do
  cp $file ~/.${file:t:r}
done

ensure_dotpath
ensure_vim_plugins
apply_git_info
