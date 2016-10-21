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
