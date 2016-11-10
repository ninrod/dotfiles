execute pathogen#infect('bundle/{}/{}')

" appearance

let g:lightline = {'colorscheme': 'base16_google'}
" let g:lightline = {'colorscheme': 'base16_paraiso'}
" let g:lightline = {'colorscheme': 'base16_pop'}
" let g:lightline = {'colorscheme': 'base16_railscasts'}

let g:tmuxline_powerline_separators = 0

set background=dark
colorscheme spacemacs-theme

" fix contrast issue with solarized dark.
" https://github.com/airblade/vim-gitgutter/issues/164
" highlight clear SignColumn

" rainbow configs
let g:rainbow_active = 1

" multiple cursors config
let g:multi_cursor_exit_from_visual_mode=0
let g:multi_cursor_exit_from_insert_mode=0
