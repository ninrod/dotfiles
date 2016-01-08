"=============================================================================
" argtextobj.vim - Text-Object like motion for arguments
"=============================================================================
"
" Author:  Takahiro SUZUKI <takahiro.suzuki.ja@gmDELETEMEail.com>
" Version: 1.1.1 (Vim 7.1)
" Licence: MIT Licence
"
"=============================================================================
" Document: {{{1
"
"-----------------------------------------------------------------------------
" Description:
"   This plugin installes a text-object like motion 'a' (argument). You can
"   d(elete), c(hange), v(select)... an argument or inner argument in familiar
"   ways, such as 'daa'(delete-an-argument), 'cia'(change-inner-argument)
"   or 'via'(select-inner-argument).
"
"   What this script do is more than just typing
"     F,dt,
"   because it recognizes inclusion relationship of parentheses.
"
"   There is an option to descide whether the motion should go out to toplevel
"   function or not in nested function application.

"
"-----------------------------------------------------------------------------
" Installation:
"   Place this file in /usr/share/vim/vim*/plugin or ~/.vim/plugin/
"   Now text-object like argument motion 'ia' and 'aa' is enabled by default.
"
"-----------------------------------------------------------------------------
" Options:
"   Write below in your .vimrc if you want to apply motions to the toplevel
"   function.
"     let g:argumentobject_force_toplevel = 1
"   By default, this options is set to 0, which means your operation affects
"   to the most inner level
"
"-----------------------------------------------------------------------------
" Examples:
" case 1: delete an argument
"     function(int arg1,    char* arg2="a,b,c(d,e)")
"                              [N]  daa
"     function(int arg1)
"                     [N] daa
"     function()
"             [N]
"
" case 2: delete inner argument
"     function(int arg1,    char* arg2="a,b,c(d,e)")
"                              [N]  cia
"     function(int arg1,    )
"                          [I]
"
" case 3: smart argument recognition (g:argumentobject_force_toplevel = 0)
"     function(1, (20*30)+40, somefunc2(3, 4))
"                   [N]  cia
"     function(1, , somefunc2(3, 4))
"                [I]
"     function(1, (20*30)+40, somefunc2(3, 4))
"                                      [N]  caa
"     function(1, (20*30)+40, somefunc2(4))
"                                      [I]
"
" case 4: smart argument recognition (g:argumentobject_force_toplevel = 1)
"     function(1, (20*30)+40, somefunc2(3, 4))
"                   [N]  cia
"     function(1, , somefunc2(3, 4))
"                [I]
"     function(1, (20*30)+40, somefunc2(3, 4))
"                                      [N]  caa
"     function(1, (20*30)+40)
"                          [I]
"
"-----------------------------------------------------------------------------
" ToDo:
"   - do nothing on null parentheses '()'
"
"-----------------------------------------------------------------------------
" ChangeLog:
"   1.1.1:
"     - debug (stop beeping on using text objects). Thanks to Nadav Samet.
"
"   1.1.unreleased:
"     - support for commas in <..> (for cpp templates)
"
"   1.1:
"     - support for commas in quoted string (".."), array ([..])
"       do nothing outside a function declaration/call
"
"   1.0:
"     - Initial release
" }}}1
"=============================================================================

if exists('loaded_argtextobj') || &cp || version < 700
  finish
endif
let loaded_argtextobj = 1

" option. turn 1 to search the most toplevel function
let g:argumentobject_force_toplevel =
  \ get(g:, 'argumentobject_force_toplevel', 0)

vnoremap <silent> <Plug>(argtextobjI) :<C-U>call argtextobj#MotionArgument(1, 1)<CR>
vnoremap <silent> <Plug>(argtextobjA) :<C-U>call argtextobj#MotionArgument(0, 1)<CR>
onoremap <silent> <Plug>(argtextobjI) :<C-U>call argtextobj#MotionArgument(1, 0)<CR>
onoremap <silent> <Plug>(argtextobjA) :<C-U>call argtextobj#MotionArgument(0, 0)<CR>
if ! hasmapto('<Plug>(argtextobjI)', 'v')
  xmap ia <Plug>(argtextobjI)
endif
if ! hasmapto('<Plug>(argtextobjA)', 'v')
  xmap aa <Plug>(argtextobjA)
endif
if ! hasmapto('<Plug>(argtextobjI)', 'o')
  omap ia <Plug>(argtextobjI)
endif
if ! hasmapto('<Plug>(argtextobjA)', 'o')
  omap aa <Plug>(argtextobjA)
endif

" vim: set foldmethod=marker et ts=2 sts=2 sw=2:
