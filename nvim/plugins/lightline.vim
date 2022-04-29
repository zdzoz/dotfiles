Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'

let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'filetype' ],
      \              [ 'indentation', 'fileformat', 'fileencoding' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name',
      \   'filename': 'LightlineFilename'
      \ },
      \ 'component': {
      \   'indentation': 'spaces: %{&shiftwidth}'
      \ },
      \ }
"     \             [ 'gitbranch' ],
" Relative filepath
function! LightlineFilename()
  return expand('%')
endfunction
