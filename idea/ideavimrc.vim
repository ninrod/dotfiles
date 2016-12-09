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

nnoremap s :action OptimizeImports<cr>

nnoremap gq :action Exit<cr>
nnoremap gr :action RenameElement<cr>
nnoremap gh :action RecentFiles<cr>
nnoremap gb :action ViewBreakpoints<cr>
nnoremap gs :action FileStructurePopup<cr>
nnoremap gf :action FindUsages<cr>
nnoremap gt :action ActivateTerminalToolWindow<cr>

" interesting actions
" :action InspectCode<cr>
" :action ChangeView<cr>
" :action RenameFile<cr>
