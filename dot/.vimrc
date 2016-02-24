" Vim Options {{{

" Switch syntax highlighting on, when the terminal has colors
syntax on

" Use vim, not vi api
set nocompatible

" No backup files
set nobackup

" No write backup
set nowritebackup

" No swap file
set noswapfile

" Command history
set history=100

" diff options. without this Gdiff was splitting horizontally on OSx.
set diffopt=filler,vertical

" Always show cursor
set ruler

" Show incomplete commands
set showcmd

" search configurations
" Incremental searching (search as you type)
set incsearch

" Highlight search matches
set hlsearch

" set smartcase
set ic

" A buffer is marked as ‘hidden’ if it has unsaved changes, and it is not currently loaded in a window.
" If you try and quit Vim while there are hidden buffers, you will raise an error:
" E162: No write since last change for buffer “a.txt”
set hidden

" Turn word wrap off
set nowrap

" Allow backspace to delete end of line, indent and start of line characters
set backspace=indent,eol,start

" Convert tabs to spaces
set expandtab

" Set tab size in spaces (this is for manual indenting)
set tabstop=2

" The number of spaces inserted for a tab (used for auto indenting)
set shiftwidth=2

" Turn on line numbers and relative line numbers
set nu
set rnu

" UTF encoding
set encoding=utf-8

" Highlight tailing whitespace
set list listchars=tab:\ \ ,trail:·

" Get rid of the delay when pressing O (for example)
" http://stackoverflow.com/questions/2158516/vim-delay-before-o-opens-a-new-line
set timeout timeoutlen=1000 ttimeoutlen=100

" Always show status bar
set laststatus=2

" Hide the toolbar
set guioptions-=T

" Autoload files that have changed outside of vim
set autoread

" http://stackoverflow.com/questions/8134647/copy-and-paste-in-vim-via-keyboard-between-different-mac-terminals
" Use system clipboard
set clipboard+=unnamed

" Don't show intro
set shortmess+=I

" Better splits (new windows appear below and to the right)
set splitbelow
set splitright

" Highlight the current line
set cursorline

" Visual autocomplete for command menu (e.g. :e ~/path/to/file)
set wildmenu

" highlight a matching [{()}] when cursor is placed on start/end character
set showmatch

" indicates a wrap line continuation
set showbreak=←←

" redraw only when we need to (i.e. don't redraw when executing a macro)
set lazyredraw

" TODO verify the usefulness of this
set wildignore+=*/.hg/*,*/.svn/*.,*/.DS_Store,*/.idea/*,*/.tmp/*,*/target/*

" I sometimes accidentally place my thumb on the macbook trackpad
set mouse=c

" enable language-dependent indenting.
filetype plugin indent on

" }}}

" Plugins {{{

call plug#begin('~/.vim/plugged')

" test
Plug 'terryma/vim-multiple-cursors', {'commit': '47c9e3f'}
" Plug 'ninrod/solarized/vim-colors-solarized'

" cosmetic
Plug 'altercation/vim-colors-solarized', {'commit': '528a59f'}
Plug 'kshenoy/vim-signature', {'commit': '7cabfb5'}

" expand core functionality
Plug 'bkad/CamelCaseMotion', {'commit': '3ae9bf9'}
Plug 'tpope/vim-commentary', {'commit': 'e0f4850'}
Plug 'tpope/vim-surround', {'commit': '2d05440'}
Plug 'tpope/vim-repeat', {'commit': '7a6675f'}
Plug 'wellle/targets.vim', {'commit': 'd111928'}

" completions
Plug 'ervandew/supertab', {'commit': '9f7da6d'}
Plug 'alvan/vim-closetag', {'commit': '21a747e'}
Plug 'jiangmiao/auto-pairs', {'tag': 'v1.3.1'}

" git
Plug 'tpope/vim-fugitive', {'commit': 'fd36aa9'}
Plug 'mhinz/vim-signify', {'commit': '2a3dafd'}

" utils
Plug 'junegunn/vim-easy-align', {'tag': '2.10.0'}
Plug 'nhooyr/neoman.vim', {'commit': '0fbdecd'}
Plug 'regedarek/ZoomWin', {'commit': 'da618cb'}


" buffer manipulation
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim', {'commit': 'be01b64'}
Plug 'ninrod/ninscratch-vim'
Plug 'qpkorr/vim-bufkill', {'commit': 'ba8b570'}

" Plugin graveyard
" Plug 'tpope/vim-endwise', {'commit': 'f06abe3'}
" Plug 'scrooloose/nerdtree', {'commit': '4ebbb53', 'on': 'NERDTreeTabsToggle'}
" Plug 'jistr/vim-nerdtree-tabs', {'commit': '0decec1', 'on': 'NERDTreeTabsToggle'}
" Plug 'SirVer/ultisnips',{'commit': '25882e9'} | Plug 'honza/vim-snippets', {'commit': '122134f'}
" Plug 'mileszs/ack.vim', {'tag': '1.0.9'}
" Plug 'jlanzarotta/bufexplorer', {'commit': 'ad2cff7'}
" Plug 'sjl/vitality.vim', {'commit': '4bb8c07'}
" Plug 'tpope/vim-unimpaired', {'commit': '23f471a'}
" Plug 'tommcdo/vim-exchange', {'commit': '9373a84'}
"   \| Plug 'gregsexton/gitv', {'commit': 'e10a896'}

" text objects (trying to live without it)
" Plug 'kana/vim-textobj-user', {'commit': 'a305416'}
"   \| Plug 'kana/vim-textobj-entire', {'commit': '41c12e1'}
"   \| Plug 'kana/vim-textobj-function', {'commit': 'adb50f3'}
"   \| Plug 'thinca/vim-textobj-function-javascript', {'commit': 'a543539'}
"   \| Plug 'whatyouhide/vim-textobj-xmlattr', {'commit': '29a154d'}

call plug#end()

" }}}

" Plugin Configuration {{{

" https://github.com/neovim/neovim/wiki/FAQ#how-can-i-change-the-cursor-shape-in-the-terminal
" kills the need for the vitality.vim plugin
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" neovim enable trucolors
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" don't let bufkill clutter <leader> binds
let g:BufKillCreateMappings = 0

" auto-pairs plugin maps 'â' in insert mode limiting our ability to type 'â'. So we fix it.
let g:AutoPairsShortcutBackInsert=''

" as we only use git, we tell this to signify for a little performance gain. Every bit counts.
let g:signify_vcs_list = ['git']

" no default mappings for bufExplorer
let g:bufExplorerDisableDefaultKeyMapping=1

" Solarized Dark Theme
set background=dark
let g:solarized_bold=1
let g:solarized_underline=0
let g:solarized_visibility="high"
let g:solarized_contrast="high"
let g:solarized_diffmode="high"
" let g:solarized_termcolors=16
colorscheme solarized

" vim-commentary: disabling double backslash
let g:commentary_map_backslash=0

" nerdtree configs
" we don't need nerdtree firing up on startup.
let g:nerdtree_tabs_open_on_gui_startup=0

" nerd tree needs to show hidden files for us
let g:NERDTreeShowHidden=1

" fix git-gutter|signify contrast issue with solarized dark.
" https://github.com/airblade/vim-gitgutter/issues/164
highlight clear SignColumn

" }}}

" Custom Binds {{{

" tip from https://youtu.be/aHm36-na4-4?t=598
nnoremap ; :
xnoremap ; :
" : is to cumbersome for `;`
nnoremap s ;

" FZF
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" CamelCaseMotion test
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge
omap <silent> <leader>iw <Plug>CamelCaseMotion_ie
xmap <silent> <leader>iw <Plug>CamelCaseMotion_ie

" quick map for signify hunk refresh
nmap <leader>- :SignifyRefresh<CR>

" :Gpush
nnoremap gp :Gpush<CR>

" trying out gl for `G`
nnoremap gl G
vnoremap gl G
onoremap gl G

" easyalign mappings
xmap <cr> <Plug>(EasyAlign)

" scratch mappings
nnoremap gs :NinScratch<CR>

" bind to facilitate bracket selection
omap ir i[
omap ar a[
xmap ir i[
xmap ar a[

" better cut/paste
xnoremap ( "0P
xnoremap ) "0p
nnoremap ( "0P
nnoremap ) "0p

" backspace is really not needed
" 'Y' can easily be replaced by 'yy', so I make 'Y' a better 'cut'
nnoremap Y "0d
xnoremap Y "0d

" space is my leader key, but '\' remains as leader.
nmap <Space> <Leader>
omap <Space> <Leader>
xmap <Space> <Leader>

" function keys
nnoremap <f2> :NERDTreeTabsToggle<cr>
nnoremap <f4> :BD<cr>
nnoremap <f5> :windo diffthis<cr>
nnoremap <f11> :so $MYVIMRC<cr>
nnoremap <f12> :e $MYVIMRC<cr>

" exits saving file
nnoremap Z ZZ

" exits without saving file
nnoremap Q ZQ

" navigate buffers
nnoremap <BS> :Buffers<cr>

" enter saves file
nnoremap <cr> :w<cr>

" turn off search highlighting
nnoremap <leader>/ :noh<cr>

" fugitive Gstatus command
nnoremap + :Gstatus<cr>

" my custom pageups and pagedowns
nmap <leader>d LztM
nmap <leader>u HzbM

" CtrlP bindings
nnoremap <leader>f :Files<cr>
nnoremap <leader>r :CtrlPMRU<cr>

" resizing windows
nmap <leader><right> <C-W>10>
nmap <leader><left>  <C-W>10<
nmap <leader><up>    <C-W>10+
nmap <leader><down>  <C-W>10-

" equalizing windows
nmap <leader>= <C-W>=

" moving between windows
nmap <leader>h <C-W>h
nmap <leader>j <C-W>j
nmap <leader>k <C-W>k
nmap <leader>l <C-W>l

" moving windows
nmap <leader>H <C-W>H
nmap <leader>J <C-W>J
nmap <leader>K <C-W>K
nmap <leader>L <C-W>L

" toggle zooming in a window
nnoremap U :ZoomWin<CR>

" open a vertical window
nmap <leader>v <C-W>v

" open a horizontal window
nmap <leader>x <C-W>s

" navigate vim help files
nnoremap  } <C-]>
nnoremap {  <C-T>

" omni completion alternative binding. see :h omnifunc
inoremap <C-p> <C-x><C-o>

" }}}

" Auto Commands {{{

" jump to last cursor
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

" specify syntax highlighting for specific files
autocmd Bufread,BufNewFile *.md set filetype=markdown " Vim interprets .md as 'modula2' otherwise, see :set filetype?
autocmd Bufread,BufNewFile *.bowerrc set filetype=json

" http://vim.wikia.com/wiki/Word_wrap_without_line_breaks
autocmd Filetype markdown setlocal wrap linebreak nolist textwidth=0 wrapmargin=0 conceallevel=0
autocmd FileType sh,ruby,yaml,zsh,vim setlocal shiftwidth=2 tabstop=2 expandtab
autocmd Filetype gitcommit setlocal spell textwidth=80

" foldmethod configurations
autocmd BufRead * setlocal foldmethod=marker
set foldlevelstart=0

" disabling auto commenting on new line, e.g. 'o' and 'O'
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" enabling <cr> to work properly on the quickfix window
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

" highlight cursor line line number
highlight CursorLineNr cterm=bold ctermfg=124

" quick bind for a 'wrap' command
command! -nargs=* Wrap set wrap linebreak nolist

" machit.vim extends % operator to work on html tags.
runtime macros/matchit.vim

" without this hack, % operator breaks on markdown file match navigation. e.g: '[' and '['.
" I suspect that other filetypes also need this.
autocmd BufReadPre,FileReadPre *.md,*.jsp MatchDebug

" quick fix for <CR> in command-line-window
autocmd CmdwinEnter * nunmap <CR>



" }}}

" Custom Functions {{{

" }}}

" Custom status line {{{

hi StatusLine ctermbg=10 ctermfg=8
hi StatusLineNC ctermbg=10 ctermfg=0

set statusline=%#identifier#
set statusline+=%f\     "tail of the filename

set statusline+=%*

set statusline+=%y      "filetype

"read only flag
set statusline+=%#identifier#
set statusline+=%r
set statusline+=%*

"modified flag
set statusline+=%#warningmsg#
set statusline+=%m
set statusline+=%*

" left|right separator
set statusline+=%=

" set statusline+=%l\|
set statusline+=%c\|
set statusline+=%P    "percent through file

" }}}
