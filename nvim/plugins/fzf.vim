Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8, 'relative': v:true } }
let $FZF_DEFAULT_OPTS = '--layout=reverse'

" Customise the Files command to use rg which respects .gitignore files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#run(fzf#wrap('files', fzf#vim#with_preview({ 'dir': <q-args>, 'source': 'rg --files --hidden' }), <bang>0))

" Add an AllFiles variation that ignores .gitignore files
command! -bang -nargs=? -complete=dir AllFiles
    \ call fzf#run(fzf#wrap('allfiles', fzf#vim#with_preview({ 'dir': <q-args>, 'source': 'rg --files --hidden --no-ignore' }), <bang>0))

nnoremap <leader>f :Files<cr>
nnoremap <leader>F :AllFiles<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>h :History<cr>
nnoremap <leader>r :Rg<cr>
nnoremap <leader>R :Rg<space>
nnoremap <leader>gb :GBranches<cr>
