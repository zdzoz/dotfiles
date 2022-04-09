local keymap, nmap, imap, vmap = require 'lib.utils'.keymap, require 'lib.utils'.nmap, require 'lib.utils'.imap, require 'lib.utils'.vmap

vim.g.mapleader = ' '
vim.g.mapleaderlocal = ' '

imap('kj', '<esc>')

keymap('n', '<leader>Q', ':bufdo bdelete<CR>')

-- spellcheck suggestions
nmap('<leader>S', 'i<c-x>s<c-p>')

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

imap(';;', '<esc>A;<esc>')
imap(',,', '<esc>A,<esc>')
imap('{{', '<esc>A{')

nmap('<leader>s', ':Startify<cr>')

-- Window navigation
nmap('<c-h>', '<c-w>h')
nmap('<c-l>', '<c-w>l')
nmap('<c-k>', '<c-w>k')
nmap('<c-j>', '<c-w>j')

-- Disable annoying command line thing
nmap('q:', ':q<CR>')

-- Move text up and down
nmap('<A-j>', ':move .+1<CR>==')
nmap('<A-k>', ':move .-2<CR>==')
imap('<A-j>', '<Esc>:move .+1<CR>==gi')
imap('<A-k>', '<Esc>:move .-2<CR>==gi')
keymap('x', '<A-j>', ":move '>+1<CR>gv-gv")
keymap('x', '<A-k>', ":move '<-2<CR>gv-gv")
