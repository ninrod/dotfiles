set hlsearch
set ignorecase
set smartcase
set incsearch
set showmode
set clipboard+=unnamed
set surround

nnoremap - :noh<cr>
map gl G
nnoremap q ZQ
nnoremap Q q
nnoremap ( {
nnoremap ) }
nnoremap <cr> :w<cr>
map g; g_
map gi g;

nnoremap gr :action RenameElement<cr>
nnoremap gh :action RecentFiles<cr>
nnoremap gb :action ViewBreakpoints<cr>
nnoremap st :action ActivateTerminalToolWindow<cr>
nnoremap so :action OptimizeImports<cr>
nnoremap ss :action FileStructurePopup<cr>

" interesting actions
" :action InspectCode<cr>
" :action ChangeView<cr>
" :action RenameFile<cr>
