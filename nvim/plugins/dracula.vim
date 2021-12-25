Plug 'dracula/vim', { 'as': 'dracula' }

augroup DraculaOverrides
    autocmd!
    autocmd ColorScheme dracula highlight DraculaBoundary guibg=none
    " autocmd ColorScheme dracula highlight DraculaDiffDelete ctermbg=none guibg=none
    autocmd User PlugLoaded ++nested colorscheme dracula
    autocmd User PlugLoaded highlight EndOfBuffer guifg=bg
augroup end
