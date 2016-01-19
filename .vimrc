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

" }}}

" Plugins {{{
execute pathogen#infect()

" required by Pathogen Plugin Manager
filetype plugin indent on

" expands '%' operator behaviour to work on opening and closing html tags.
runtime macros/matchit.vim

" vim-rsi plugin
let g:rsi_no_meta = 1

" auto-pairs plugin binds 'â' in insert mode limiting our ability to type 'â'. So we fix it.
let g:AutoPairsShortcutBackInsert=''

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" as we only use git, we tell this to signify for a little performance gain. Every bit counts.
let g:signify_vcs_list = ['git']

" no default mappings for bufExplorer. We just need the toggle bind.
let g:bufExplorerDisableDefaultKeyMapping=1

"Path to the Rust Racer autocomplete tool"
let g:racer_cmd ="/Users/ninrod/code/lib/rust/racer/target/release/racer"

" Solarized Dark Theme
set background=dark
let g:solarized_bold=1
let g:solarized_underline=0
let g:solarized_visibility="high"
let g:solarized_contrast="high"
let g:solarized_diffmode="high"
if !has("gui_running")
    " terminal vim...
    let g:solarized_termcolors=16
else
    " macVim | gVim
    set guifont=Sauce\ Code\ Powerline:h11
endif
colorscheme solarized

" papercolor theme
" set background=light
" colorscheme PaperColor

" vim-commentary: disabling double backslash
let g:commentary_map_backslash=0

" nerdtree configs
" we don't need nerdtree firing up on startup.
let g:nerdtree_tabs_open_on_gui_startup=0

" nerd tree needs to show hidden files for us
let g:NERDTreeShowHidden=1

" CtrlP configs
let g:ctrlp_show_hidden=1
let g:ctrlp_working_path_mode=0
let g:ctrlp_max_height=10
let g:ctrlp_reuse_window = 'Scratch'
let g:ctrlp_arg_map = 1
set wildignore+=*/.hg/*,*/.svn/*.,*/.DS_Store,*/.idea/*,*/.tmp/*,*/target/*
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

" Airline configs(status line)

" airline theme
let g:airline_theme='base16'

" airline: if you don't want to use a powerline patched font
let g:airline_powerline_fonts = 1
" let g:airline_left_sep=''
" let g:airline_right_sep=''

" airline: hunks, branch
" let g:airline_section_b = ''

" airline: fileencoding, fileformat
" let g:airline_section_y = ''

" airline: line, column number
" let g:airline_section_z = ''

" airline: extension configs
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#hunks#enabled = 0

" fix git-gutter|signify contrast issue with solarized dark.
" https://github.com/airblade/vim-gitgutter/issues/164
highlight clear SignColumn

" }}}

" Mappings {{{

" :Gpush
nnoremap gp :Gpush<CR>

" easyalign mappings
xmap <cr> <Plug>(EasyAlign)

" scratch mappings
nnoremap gs :NinScratch<CR>

" vim-numbertoggle binding
let g:NumberToggleTrigger="#"
nmap <leader># :set nu!<CR>

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
" open up all folds a start
set foldlevelstart=20
" autocmd BufRead * normal zM

" disabling auto commenting on new line, e.g. 'o' and 'O'
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" enabling <cr> to work properly on the quickfix window
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

" trailing whitespace hack
highlight ExtraWhitespace ctermbg=218 guibg=218
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" }}}
