function! SetColorColumn()
    if &textwidth == 0
        setlocal colorcolumn=0
    else
        setlocal colorcolumn=+0
    endif
endfunction

augroup color_column
    autocmd!
    autocmd OptionSet textwidth call SetColorColumn()
    autocmd BufEnter * call SetColorColumn()
augroup end


function! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfunction

augroup trim_whitespace
    autocmd!
    autocmd BufWritePre * call TrimWhitespace()
augroup end
