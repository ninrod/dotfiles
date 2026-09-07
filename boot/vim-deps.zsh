mkdir -p $vim_deps && cd $vim_deps

# fetch core editing deps
#
ningrab bronson/vim-visual-star-search
ningrab vim-scripts/vis
ningrab chaoren/vim-wordmotion
ningrab ervandew/supertab
ningrab junegunn/fzf.vim
ningrab junegunn/vim-easy-align
ningrab tommcdo/vim-exchange
ningrab vim-scripts/ReplaceWithRegister
ningrab francoiscabrol/ranger.vim

ningrab wellle/targets.vim

########################################
########        MIGRADOS       #########
########################################

ningrab kana/vim-textobj-entire
ningrab kana/vim-textobj-user
ningrab ninrod/ninscratch-vim
ningrab terryma/vim-multiple-cursors
ningrab tpope/vim-commentary
ningrab tpope/vim-pathogen
ningrab tpope/vim-repeat
ningrab tpope/vim-surround

# fetch cosmetic deps
ningrab itchyny/lightline.vim
ningrab morhetz/gruvbox
ningrab junegunn/rainbow_parentheses.vim

# fetch buffer/file manipulation deps
ningrab jlanzarotta/bufexplorer

# filetypes
ningrab chr4/nginx.vim

# pathogen installation
PATHOGEN_FILE=$vim_deps/tpope/vim-pathogen/autoload/pathogen.vim
AUTOLOAD_DIR=~/.vim/autoload
[[ ! -d  $AUTOLOAD_DIR ]] && mkdir -p $AUTOLOAD_DIR
cp $PATHOGEN_FILE ~/.vim/autoload

