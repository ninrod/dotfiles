# tpope's pathogen install procedure
autoload_folder=$GIT_ROOT/vim/autoload
mkdir -p $autoload_folder && cd $autoload_folder
ningrab tpope/vim-pathogen
ln -sf tpope/vim-pathogen/autoload/pathogen.vim .

# fetch vim deps
bundle=$GIT_ROOT/vim/bundle
mkdir -p $bundle && cd $bundle

ningrab dracula_vim
ningrab itchyny_lightline.vim
ningrab edkolev_tmuxline.vim
ningrab bronson_vim-visual-star-search
ningrab chaoren_vim-wordmotion
ningrab ervandew_supertab
ningrab jiangmiao_auto-pairs
ningrab junegunn_vim-easy-align
ningrab luochen1990_rainbow
ningrab ninrod_vim-multiple-cursors
ningrab tommcdo_vim-exchange
ningrab tpope_vim-commentary
ningrab tpope_vim-repeat
ningrab tpope_vim-surround
ningrab wellle_targets.vim
