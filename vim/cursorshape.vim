" escape sequence: `^[]1337;CursorShape=N^G`. where:
" N=0: block;
" N=1: line;
" N=2: underline;
" ^G = \x7
" ˆ[ = \e
" more info here http://www.iterm2.com/documentation-escape-codes.html
" better cursor shape for vim in terminal (works with iTerm2)
" see: https://www.iterm2.com/documentation-escape-codes.html
" SI = START insert mode
" EI = END insert mode
" SR = START replace mode

if empty($TMUX)
  let &t_SI = "\<Esc>]1337;CursorShape=1\x7"
  let &t_EI = "\<Esc>]1337;CursorShape=0\x7"
  let &t_SR = "\<Esc>]1337;CursorShape=2\x7"
else
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]1337;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]1337;CursorShape=0\x7\<Esc>\\"
  let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]1337;CursorShape=2\x7\<Esc>\\"
endif
