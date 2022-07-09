local keymap, nmap, imap, vmap = require 'lib.utils'.keymap, require 'lib.utils'.nmap, require 'lib.utils'.imap, require 'lib.utils'.vmap
local actions = require 'telescope.actions'

require('telescope').setup {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    path_display = { truncate = 1 },
    prompt_prefix = "  ",
    selection_caret = "  ",
    entry_prefix = "  ",
    sorting_strategy = 'ascending',
    layout_strategy = 'horizontal',
    layout_config = {
      prompt_position = 'top',
    },
    winblend = 0,
    border = {},
    borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
    color_devicons = true,
    mappings = {
      i = {
        ['<esc>'] = actions.close,
        ['<c-down>'] = actions.cycle_history_next,
        ['<c-up>'] = actions.cycle_history_prev,
      },
    },
    file_ignore_patterns = { '.git/', 'node_modules' },
  },
  pickers = {
    find_files = {
      hidden = true,
    },
    oldfiles = {
      prompt_title = 'History',
    },
  },
}

require('telescope').load_extension('fzf')

keymap('n', '<leader>f', [[<cmd>lua require('telescope.builtin').find_files()<CR>]])
keymap('n', '<leader>F', [[<cmd>lua require('telescope.builtin').find_files({ no_ignore = true, prompt_title = 'All Files' })<CR>]]) -- luacheck: no max line length
keymap('n', '<leader>r', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]])
keymap('n', '<leader>b', [[<cmd>lua require('telescope.builtin').buffers()<CR>]])
keymap('n', '<leader>h', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]])
keymap('n', '<leader>g', [[<cmd>lua require('telescope.builtin').git_branches()<CR>]])
keymap('n', '<leader>/', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]])

vim.cmd('hi TelescopeTitle guibg=#4154e8')
