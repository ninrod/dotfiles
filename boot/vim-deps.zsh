mkdir -p $vim_deps && cd $vim_deps

# fetch core editing deps
ningrab bronson/vim-visual-star-search
ningrab chaoren/vim-wordmotion
ningrab ervandew/supertab
ningrab jiangmiao/auto-pairs
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
ningrab junegunn/fzf.vim
ningrab junegunn/vim-easy-align

# fetch cosmetic deps
ningrab morhetz/gruvbox
ningrab itchyny/lightline.vim

# pathogen installation
PATHOGEN_FILE=$vim_deps/tpope/vim-pathogen/autoload/pathogen.vim
AUTOLOAD_DIR=~/.vim/autoload
[[ ! -d  $AUTOLOAD_DIR ]] && mkdir -p $AUTOLOAD_DIR
cp $PATHOGEN_FILE ~/.vim/autoload
