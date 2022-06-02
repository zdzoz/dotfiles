local keymap, nmap, imap, vmap = require 'lib.utils'.keymap, require 'lib.utils'.nmap, require 'lib.utils'.imap, require 'lib.utils'.vmap

vim.g.mapleader = ' '
vim.g.mapleaderlocal = ' '

imap('kj', '<esc>')

keymap('n', '<leader>Q', ':bufdo bdelete<CR>')

-- Allow gf to open non-existent files
keymap('', 'gf', ':edit <cfile><CR>')

-- Open file under cursor in vertical split
nmap('gv', '<c-w>vgf')


vmap('>', '>gv')
vmap('<', '<gv')

-- Maintain the cursor position when yanking a visual selection
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
vmap('y', 'myy`y')
vmap('Y', 'myY`y')

-- Maintain cursor position when joining
nmap('J', 'mzJ`z')

-- Keep search centered
nmap('n', 'nzzzv')
nmap('N', 'Nzzzv')
nmap('<esc>', ':nohlsearch<cr>')

nmap('H', '^')
nmap('L', '$')
vmap('H', '^')
vmap('L', '$')

imap(';;', '<esc>a;<esc>')
imap(',,', '<esc>a,<esc>')
imap('{{', '<esc>a{')

-- disable annoying command line thing
nmap('q:', ':q<cr>')

-- move text up and down
nmap('<a-j>', ':move .+1<cr>==')
nmap('<a-k>', ':move .-2<cr>==')
imap('<a-j>', '<esc>:move .+1<cr>==gi')
imap('<a-k>', '<esc>:move .-2<cr>==gi')
keymap('x', '<a-j>', ":move '>+1<cr>gv-gv")
keymap('x', '<a-k>', ":move '<-2<cr>gv-gv")

-- ctrl-s for save
nmap('<c-s>', ':w<cr>')
imap('<c-s>', '<esc>:w<cr>a')
