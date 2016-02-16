" textobj-function - Text objects for functions
" Version: 0.4.0
" Copyright (C) 2014 Kana Natsuno <http://whileimautomaton.net/>
" License: MIT license  {{{
"     Permission is hereby granted, free of charge, to any person obtaining
"     a copy of this software and associated documentation files (the
"     "Software"), to deal in the Software without restriction, including
"     without limitation the rights to use, copy, modify, merge, publish,
"     distribute, sublicense, and/or sell copies of the Software, and to
"     permit persons to whom the Software is furnished to do so, subject to
"     the following conditions:
"
"     The above copyright notice and this permission notice shall be included
"     in all copies or substantial portions of the Software.
"
"     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
"     OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
"     MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
"     IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
"     CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
"     TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
"     SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
" }}}

let s:FUNCTION_PATTERNS = {
\   'begin': '^\s*fu\%[nction]\>',
\   'end': '^\s*endf\%[unction]\>',
\ }

let s:VSPEC_BLOCK_PATTERNS = {
\   'begin': '\v^\s*<%(describe|it|before|after)>',
\   'end': '\v^\s*<end>',
\ }

function! textobj#function#vim#select(object_type)
  return s:select_{a:object_type}()
endfunction

function! s:select_a()
  let r = s:select_a_of(s:FUNCTION_PATTERNS)
  return r is 0 ? s:select_a_of(s:VSPEC_BLOCK_PATTERNS) : r
endfunction

function! s:select_a_of(patterns)
  if getline('.') !~# a:patterns.end
    if searchpair(a:patterns.begin, '', a:patterns.end, 'W') <= 0
      " The cursor seems not to be placed on any function.
      return 0
    endif
  endif
  normal! $
  let e = getpos('.')
  normal! 0
  call searchpair(a:patterns.begin, '', a:patterns.end, 'bW')
  let b = getpos('.')

  if b != e
    return ['V', b, e]
  else
    return 0
  endif
endfunction

function! s:select_i()
  let range = s:select_a()
  if range is 0
    return 0
  endif

  let [_, ba, ea] = range
  if ea[1] - ba[1] <= 1  " The function doesn't contain any code.
    return 0
  endif

  call setpos('.', ba)
  normal! j0
  let bi = getpos('.')
  call setpos('.', ea)
  normal! k$
  let ei = getpos('.')
  return ['V', bi, ei]
endfunction

" __END__  "{{{1
" vim: foldmethod=marker
