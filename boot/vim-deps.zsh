# tpope's pathogen install procedure
autoload_folder=$GIT_ROOT/vim/autoload
mkdir -p $autoload_folder && cd $autoload_folder
ningrab tpope/vim-pathogen
ln -sf tpope/vim-pathogen/autoload/pathogen.vim .

# fetch vim deps
bundle=$GIT_ROOT/vim/bundle
mkdir -p $bundle && cd $bundle

# ningrab morhetz/gruvbox
ningrab dracula
ningrab lightline.vim
ningrab tmuxline.vim
ningrab vim-visual-star-search
ningrab vim-wordmotion
ningrab supertab
ningrab auto-pairs
ningrab vim-easy-align
ningrab rainbow
ningrab vim-multiple-cursors
ningrab vim-exchange
ningrab vim-commentary
ningrab vim-repeat
ningrab vim-surround
ningrab targets.vim
