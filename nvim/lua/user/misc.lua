vim.cmd [[
    " Automatically create non-existing folders
    function s:MkNonExDir(file, buf)
        if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
            let dir=fnamemodify(a:file, ':h')
            if !isdirectory(dir)
                call mkdir(dir, 'p')
            endif
        endif
    endfunction
    augroup BWCCreateDir
        autocmd!
        autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
    augroup END

    " Toggle maximize vsplit-view
    nnoremap <silent><expr> <leader>m <SID>maximizeToggle()
    function! s:maximizeToggle()
        if exists("s:maximize_toggle")
            unlet s:maximize_toggle
            return "\<c-w>="
        else
            let s:maximize_toggle = ""
            return "\<c-w>|\<c-w>_"
        endif
    endfunction
]]
