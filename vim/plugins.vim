" rainbow configs
let g:rainbow_active = 1

" vim-multiple-cursors
let g:multi_cursor_exit_from_visual_mode=0
let g:multi_cursor_exit_from_insert_mode=0

let basepath=','.'~/.vim/plugged/'

" theme plugins
let &runtimepath.=basepath . 'morhetz/gruvbox'
let &runtimepath.=basepath . 'itchyny/lightline.vim'
" let &runtimepath.=basepath . 'edkolev/tmuxline.vim'

"core
let &runtimepath.=basepath . 'bronson/vim-visual-star-search'
let &runtimepath.=basepath . 'chaoren/vim-wordmotion'
let &runtimepath.=basepath . 'ervandew/supertab'
let &runtimepath.=basepath . 'jiangmiao/auto-pairs'
let &runtimepath.=basepath . 'junegunn/vim-easy-align'
let &runtimepath.=basepath . 'luochen1990/rainbow'
let &runtimepath.=basepath . 'ninrod/vim-multiple-cursors'
let &runtimepath.=basepath . 'tommcdo/vim-exchange'
let &runtimepath.=basepath . 'tpope/vim-commentary'
let &runtimepath.=basepath . 'tpope/vim-repeat'
let &runtimepath.=basepath . 'tpope/vim-surround'
let &runtimepath.=basepath . 'wellle/targets.vim'
