# tpope's pathogen install procedure
autoload_folder=$GIT_ROOT/vim/autoload
mkdir -p $autoload_folder && cd $autoload_folder
ningrab tpope/vim-pathogen
ln -sf tpope/vim-pathogen/autoload/pathogen.vim .

# fetch vim deps
bundle=$GIT_ROOT/vim/bundle
mkdir -p $bundle && cd $bundle

# core editing
ningrab bronson_vim-visual-star-search
ningrab chaoren_vim-wordmotion
ningrab ervandew_supertab
ningrab jiangmiao_auto-pairs
ningrab junegunn_vim-easy-align
ningrab ninrod_vim-multiple-cursors
ningrab tommcdo_vim-exchange
ningrab tpope_vim-commentary
ningrab tpope_vim-repeat
ningrab tpope_vim-surround
ningrab wellle_targets.vim

# ningrab dracula_vim
# themes
ningrab chriskempson_base16-vim
ningrab itchyny_lightline.vim
ningrab felixjung_vim-base16-lightline
ningrab edkolev_tmuxline.vim
ningrab luochen1990_rainbow
