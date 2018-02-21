" romainl auto expansion hacks
" hack found here: https://www.reddit.com/r/vim/comments/6h0dy7/which_autoclosing_plugin_do_you_use/diujtbd/
" tries to make <CR> a little smarter in insert mode:
" - expands [{()}] 'correctly'
" - expands <tag>|</tag> 'correctly'
" - removes empty comment marker
function! icr#ICR()
    " specific case: beware of the cmdline window
    if &buftype ==# "quickfix" || &buftype ==# "nofile"
        return "\<CR>"
    endif

    " specific case: <CR><CR> to get out of commenting
    if getline(".") =~ '^\s*\(\*\|//\|#\|"\)\s*$'
        return "\<C-u>"
    endif

    " generic case
    let previous = getline(".")[col(".")-2]
    let next     = getline(".")[col(".")-1]

    if previous ==# "{"
        return <SID>PairExpander(previous, "}", next)
    elseif previous ==# "["
        return <SID>PairExpander(previous, "]", next)
    elseif previous ==# "("
        return <SID>PairExpander(previous, ")", next)
    elseif previous ==# ">"
        return <SID>TagExpander(next)
    else
        return "\<CR>"
    endif
endfunction

function! s:PairExpander(left, right, next)
    let pair_position = []

    if a:left == "["
        let pair_position = searchpairpos('\' . a:left, "", '\' . a:right, "Wn")
    else
        let pair_position = searchpairpos(a:left, "", a:right, "Wn")
    endif

    if a:next !=# a:right && pair_position[0] == 0
        return "\<CR>" . a:right . "\<C-o>==O"
    elseif a:next !=# a:right && pair_position[0] != 0 && indent(pair_position[0]) != indent(".")
        return "\<CR>" . a:right . "\<C-o>==O"
    elseif a:next ==# a:right
        return "\<CR>\<C-o>==O"
    else
        return "\<CR>"
    endif
endfunction

function! s:TagExpander(next)
    let thisline = getline(".")

    if a:next ==# "<" && thisline[col(".")] ==# "/"
        if thisline[searchpos("<", "bnW")[1]] ==# "/" || thisline[searchpos("<", "bnW")[1]] !=# thisline[col(".") + 1]
            return "\<CR>"
        else
            return "\<CR>\<C-o>==O"
        endif
    else
        return "\<CR>"
    endif
endfunction
