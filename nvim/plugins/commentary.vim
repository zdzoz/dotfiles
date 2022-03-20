Plug 'tpope/vim-commentary'

augroup CommentaryOverrides
    autocmd!
    autocmd User PlugLoaded :autocmd FileType cpp setlocal commentstring=//\ %s
augroup end
