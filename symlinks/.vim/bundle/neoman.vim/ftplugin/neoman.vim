" Copyright (C) 2016  Sethi, Anmol <anmol@aubble.com>
" Author: Sethi, Anmol <anmol@aubble.com>
" 
" This program is free software: you can redistribute it and/or modify
" it under the terms of the GNU General Public License as published by
" the Free Software Foundation, either version 3 of the License, or
" (at your option) any later version.
" 
" This program is distributed in the hope that it will be useful,
" but WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
" GNU General Public License for more details.
" 
" You should have received a copy of the GNU General Public License
" along with this program.  If not, see <http://www.gnu.org/licenses/>.

if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1

setlocal iskeyword+=\.,-,(,),:
setlocal buftype=nofile
setlocal noswapfile
setlocal bufhidden=hide
setlocal nobuflisted
setlocal nomodified
setlocal readonly
setlocal nomodifiable
setlocal noexpandtab
setlocal tabstop=8
setlocal softtabstop=8
setlocal shiftwidth=8
setlocal nolist
setlocal foldcolumn=0
setlocal colorcolumn=0

if !exists("g:no_plugin_maps") && !exists("g:no_man_maps")
  nnoremap <silent> <buffer> <C-]>    :call neoman#get_page(!g:neoman_current_window)<CR>
  nnoremap <silent> <buffer> <C-T>    :call neoman#pop_page()<CR>
  nnoremap <silent> <nowait><buffer>  q <C-W>c
  nnoremap <silent> <buffer> q :q<CR>
  if &keywordprg !=# ':Nman'
    nnoremap <silent> <buffer> K      :call neoman#get_page(!g:neoman_current_window)<CR>
  endif
endif

let b:undo_ftplugin = 'setlocal iskeyword<'
