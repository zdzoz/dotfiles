vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_group_empty = 1

require'nvim-tree'.setup {
    git = {
        ignore = false,
    },
    renderer = {
        indent_markers = {
            enable = true,
        },
    },
}

vim.cmd([[
    autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]])

vim.api.nvim_set_keymap('n', '<leader>n', ':NvimTreeFindFileToggle<CR>', { silent = true, noremap = true })
