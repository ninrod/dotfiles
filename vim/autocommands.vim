" better defaults ---------------
" foldmethod configurations
autocmd BufRead * setlocal foldmethod=marker
  set foldlevelstart=0

" jump to last cursor
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

" disabling auto commenting on new line, e.g. 'o' and 'O'
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" machit ------------------------
" machit.vim extends % operator to work on html tags.
runtime macros/matchit.vim
autocmd BufReadPre,FileReadPre *.md,*.jsp MatchDebug

" binds ----------------------
" enabling <cr> to work properly on the quickfix window
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

" fix for <CR> in command-line-window
silent! autocmd CmdwinEnter * nunmap <cr>
silent! autocmd CmdwinLeave * nnoremap <cr> :w<cr>

" quick bind for a 'wrap' command
command! -nargs=* Wrap set wrap linebreak nolist


" filetypes ----------------------
" specify syntax highlighting for specific files
autocmd Bufread,BufNewFile *.md set filetype=markdown " Vim interprets .md as 'modula2' otherwise, see :set filetype?
autocmd Bufread,BufNewFile *.bowerrc set filetype=json

" http://vim.wikia.com/wiki/Word_wrap_without_line_breaks
autocmd Filetype markdown setlocal wrap linebreak nolist textwidth=0 wrapmargin=0 conceallevel=0 fdm=expr
autocmd FileType sh,ruby,yaml,zsh,vim setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType java setlocal shiftwidth=4 tabstop=4 expandtab
autocmd Filetype gitcommit setlocal spell textwidth=80
