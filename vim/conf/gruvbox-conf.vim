" theme plugins
call LoadPlugin('morhetz/gruvbox')

" less eye strain
set background=dark

" must be set before invoking colorscheme
" gruvbox inverted selection is too much information to me
" plus, the inverted select does not
" play nicely with vim-multiple-cursors
let g:gruvbox_invert_selection=0

silent! colorscheme gruvbox

" see https://github.com/neovim/neovim/issues/4946
" 124 = gruvbox red
highlight SpecialKey ctermfg=124 guifg=#cc241d                            	

" fix contrast issue with solarized dark.
" https://github.com/airblade/vim-gitgutter/issues/164
highlight clear SignColumn
