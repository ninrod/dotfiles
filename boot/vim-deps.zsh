# setup vim deps dir
mkdir -p $vim_deps && cd $vim_deps

# fetch core editing deps
ningrab bronson/vim-visual-star-search
ningrab chaoren/vim-wordmotion
ningrab ervandew/supertab
ningrab jiangmiao/auto-pairs
ningrab junegunn/vim-easy-align
ningrab ninrod/vim-multiple-cursors
ningrab tommcdo/vim-exchange
ningrab tpope/vim-commentary
ningrab tpope/vim-pathogen
ningrab tpope/vim-repeat
ningrab tpope/vim-surround
ningrab vim-scripts/ReplaceWithRegister
ningrab wellle/targets.vim
ningrab kana/vim-textobj-user
ningrab kana/vim-textobj-entire
ningrab whatyouhide/vim-textobj-xmlattr

# fetch cosmetic deps
ningrab ninrod/gruvbox develop # just while I wait for morhetz/gruvbox#150 to merge.
ningrab itchyny/lightline.vim
ningrab edkolev/tmuxline.vim
ningrab luochen1990/rainbow
