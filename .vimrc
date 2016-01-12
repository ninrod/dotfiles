" Settings {{{

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
set tabstop=4

" The number of spaces inserted for a tab (used for auto indenting)
set shiftwidth=4

" Turn on line numbers
set number

" UTF encoding
set encoding=utf-8

" Highlight tailing whitespace
set list listchars=tab:\ \ ,trail:·

" Get rid of the delay when pressing O (for example)
" http://stackoverflow.com/questions/2158516/vim-delay-before-o-opens-a-new-line
set timeout timeoutlen=1000 ttimeoutlen=100

" Always show status bar
set laststatus=2

" Set the status line to something useful
set statusline=%f\ %=L:%l/%L\ %c\ (%p%%)
" set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

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

" Ensure Vim doesn't beep at you every time you make a mistype
set visualbell

" Visual autocomplete for command menu (e.g. :e ~/path/to/file)
set wildmenu

" redraw only when we need to (i.e. don't redraw when executing a macro)
set lazyredraw

" highlight a matching [{()}] when cursor is placed on start/end character
set showmatch

" vertical ruler
" autocmd BufWinEnter * highlight ColorColumn ctermbg=darkred
" set colorcolumn=201

" }}}

" Plugins {{{
execute pathogen#infect()

" required by Pathogen Plugin Manager
filetype plugin indent on

runtime macros/matchit.vim

" auto-pairs plugin binds 'â' in insert mode
let g:AutoPairsShortcutBackInsert=''

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

let g:signify_vcs_list = ['git']

" enabling rainbow plugin at start
let g:rainbow_active = 1

" rainbow sucks on html
let g:rainbow_conf = {'separately': {'html': 0}}

" no default mappings for bufExplorer
let g:bufExplorerDisableDefaultKeyMapping=1

"Rust Racer autocomplete tool"
let g:racer_cmd ="/Users/ninrod/code/lib/rust/racer/target/release/racer"


" Theme
set background=dark
let g:solarized_bold=1
let g:solarized_underline=0
let g:solarized_visibility="high"
let g:solarized_contrast="high"

if !has("gui_running")
    " terminal vim...
    let g:solarized_termcolors=16
else
    " macVim | gVim
    set guifont=Sauce\ Code\ Powerline:h11
endif

colorscheme solarized

" vim-commentary: disabling double backslash
let g:commentary_map_backslash=0

" vim-signature bookmark plugin
let g:signaturemarkertexthldynamic = 1

" nerdtree configs
let g:nerdtree_tabs_open_on_gui_startup=0
let g:NERDTreeShowHidden=1

" CtrlP configs
let g:ctrlp_show_hidden=1
let g:ctrlp_working_path_mode=0
let g:ctrlp_max_height=10

" let ctrlp reuse Scratch's windows
let g:ctrlp_reuse_window = 'Scratch'

" CtrlP -> override <C-o> to provide options for how to open files
let g:ctrlp_arg_map = 1

" CtrlP -> files matched are ignored when expanding wildcards
set wildignore+=*/.hg/*,*/.svn/*.,*/.DS_Store,*/.idea/*,*/.tmp/*,*/target/*

" CtrlP -> directories to ignore when fuzzy finding
let g:ctrlp_custom_ignore = '
      \\.git$\|
      \\.pdf$\|
      \\.log$\|
      \\.out$\|
      \\.aux$\|
      \\.hg$\|
      \\.grunt$\|
      \\.sass-cache$\|
      \bower_components$\|
      \node_modules$\|
      \\.svn$
      \'

" Airline (status line)
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_theme='base16'


highlight clear SignColumn
" }}}

" Mappings {{{

" scratch mappings
nnoremap gs :NinScratch<CR>
nnoremap & :set buftype=nofile<CR>

" vim-numbertoggle binding
let g:NumberToggleTrigger="#"
nmap <leader># :set nu!<CR>

" better cut/paste
xnoremap ( "0P
xnoremap ) "0p
nnoremap ( "0P
nnoremap ) "0p

" backspace is really not needed
" 'Y' can easily be replaced by 'yy', so I make 'Y' a better 'cut'
nnoremap Y "0d
xnoremap Y "0d

" just highlight the word, without moving to the next.
nnoremap * *N

" very magic mode on.
nnoremap ? /\v

" space is my leader key, but '\' remains as leader
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
nnoremap <BS> :ToggleBufExplorer<cr>

" enter saves file
nnoremap <cr> :w<cr>

" turn off search highlighting
nnoremap - :noh<cr>

" fugitive Gstatus command
nnoremap + :Gstatus<cr>

" my custom pageups and pagedowns
nmap <leader>d LztM
nmap <leader>u HzbM

" CtrlP bindings
nnoremap <leader>f :CtrlP<cr>
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
nmap <leader>w <C-W>w

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

" omni completion alternative binding
inoremap <C-p> <C-x><C-o>

" Tabularize
" map <Leader>e :Tabularize /=<cr>
" map <Leader>c :Tabularize /:<cr>
" }}}

" Auto Commands {{{
" jump to last cursor
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

autocmd BufReadPost fugitive://* set bufhidden=delete

" file formats
autocmd Filetype gitcommit setlocal spell textwidth=80
autocmd Filetype markdown setlocal wrap linebreak nolist textwidth=0 wrapmargin=0 " http://vim.wikia.com/wiki/Word_wrap_without_line_breaks
autocmd FileType sh,ruby,yaml,zsh,vim setlocal shiftwidth=2 tabstop=2 expandtab

" specify syntax highlighting for specific files
autocmd Bufread,BufNewFile *.spv set filetype=php
autocmd Bufread,BufNewFile *.md set filetype=markdown " Vim interprets .md as 'modula2' otherwise, see :set filetype?

" foldmethod configurations
autocmd BufRead * setlocal foldmethod=marker
" abrir os folds por padrão
set foldlevelstart=20
" autocmd BufRead * normal zM

" Change colourscheme when diffing
fun! SetDiffColors()
  highlight DiffAdd    cterm=bold ctermfg=white ctermbg=DarkGreen
  highlight DiffDelete cterm=bold ctermfg=white ctermbg=DarkGrey
  highlight DiffChange cterm=bold ctermfg=white ctermbg=DarkBlue
  highlight DiffText   cterm=bold ctermfg=white ctermbg=DarkRed
endfun
autocmd FilterWritePre * call SetDiffColors()

" disabling auto commenting on new line, e.g. 'o' and 'O'
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" enabling <cr> to work properly on the quickfix window
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

" }}}
