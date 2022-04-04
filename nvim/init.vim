"  ---------------
"  --- General ---
"  ---------------

set expandtab
set tabstop=4
set shiftwidth=4
set number
set relativenumber
set laststatus=2
set noshowmode
set nowrap
set ignorecase
set smartcase
set signcolumn=number
set title
set spell
set mouse=a
set hidden
set termguicolors
set splitright
set list
set listchars=tab:▸\ ,trail:·
set scrolloff=8
set sidescrolloff=8
set nojoinspaces
set undofile
set wildmode=longest:full,full
set clipboard+=unnamedplus
set confirm
set backup
set backupdir=~/.local/share/nvim/backup//
set updatetime=250

" ----------------
" --- Key maps ---
" ----------------

let mapleader = "\<space>"

inoremap kj <esc>

" spellcheck suggestions
nnoremap <leader>s i<c-x>s<c-p>

" Allow gf to open non-existent files
noremap gf :edit <cfile><cr>

" Reselect visual selection after indenting
vnoremap > >gv
vnoremap < <gv

" Maintain the cursor position when yanking a visual selection
" http://ddrscott.github.io/blog/2016/yank-without-jank/
vnoremap y myy`y
vnoremap Y myY`y

" delete without yanking
nnoremap <leader>d d
nnoremap d "_d
vnoremap <leader>d "_d

" replace currently selected text with default register without yanking it
vnoremap <leader>p "_dP

" Maintain cursor position when joining
nnoremap J mzJ`z

" Keep search centered
nnoremap n nzzzv
nnoremap N Nzzzv

nnoremap H 0
nnoremap L $
nnoremap <esc> :nohlsearch<cr>

inoremap ;; <esc>A;<esc>
inoremap ,, <esc>A,<esc>

" Open file under cursor in vertical split
nnoremap gv <c-w>vgf

nnoremap <leader>S :Startify<cr>

" window navigation
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <c-k> <c-w>k
nnoremap <c-j> <c-w>j

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

" ---------------
" --- Plugins ---
" ---------------

" Auto install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(data_dir . '/plugins')

source ~/.config/nvim/plugins/fzf.vim
source ~/.config/nvim/plugins/polyglot.vim
source ~/.config/nvim/plugins/dracula.vim
source ~/.config/nvim/plugins/startify.vim
source ~/.config/nvim/plugins/floaterm.vim
source ~/.config/nvim/plugins/commentary.vim
source ~/.config/nvim/plugins/eunuch.vim
source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/lightline.vim

call plug#end()
doautocmd User PlugLoaded
