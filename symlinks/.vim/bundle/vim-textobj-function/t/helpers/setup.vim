filetype plugin on
runtime! plugin/textobj/function.vim

function! PasteSampleCode(filetype)
  read `='t/fixtures/sample.' . a:filetype`
endfunction

function! Select(line_number, object)
  call cursor(a:line_number, 1)
  execute 'normal' 'v'.a:object."\<Esc>"
  return [visualmode(), line("'<"), line("'>")]
endfunction
