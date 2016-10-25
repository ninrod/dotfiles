syntax on
filetype plugin indent on

" add truecolor support, if available
if has('termguicolors')
  set termguicolors
endif

" backups
set nobackup
set nowritebackup
set noswapfile

" better '/'
set incsearch
set hlsearch
set ignorecase

" convert tabs to spaces
set expandtab
set tabstop=2
set shiftwidth=2

set history=1000

" diff options. without this Gdiff was splitting horizontally on OSx.
set diffopt=filler,vertical

" show partial commands from operator pending mode
set showcmd

" show line numbers on status line
set ruler

" with this option on, a buffer is marked as ‘hidden’ if it has unsaved changes, and it is not currently loaded in a window.
" If you try and quit Vim while there are hidden buffers, you will raise an error:
" E162: No write since last change for buffer “a.txt”
set hidden

" fix backspace behaviour
set backspace=indent,eol,start

" show trailing spaces
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
" better gui clipboard integration
set clipboard+=unnamed

" Don't show intro
set shortmess+=I

" better splits
set splitbelow
set splitright

" Highlight the current line
" set cursorline

" Visual autocomplete for command menu (e.g. :e ~/path/to/file)
" partially lifted from http://stackoverflow.com/a/15583861/4921402
set wildmenu
set wildmode=list:longest,list:full
set wildignore+=*/.hg/*,*/.svn/*.,*/.DS_Store,*/.idea/*,*/.tmp/*,*/target/*

" highlight a matching [{()}] when cursor is placed on start/end character
set showmatch

" do not wrap long lines
set nowrap

" indicates a wrap line continuation
set showbreak=←←

" redraw only when we need to (i.e. don't redraw when executing a macro)
set lazyredraw

" syntax/sh.vim adds `.` to iskeyword(verify with :verbose set iskeyword?). so `w` jumps past it. see :h g:sh_isk
let g:sh_noisk=1

let g:netrw_banner      = 0
let g:netrw_bufsettings = 'relativenumber, number'
let g:netrw_liststyle   = 1
" let g:netrw_keepdir   = 0
