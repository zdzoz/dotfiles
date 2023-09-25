return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.3',
    lazy = false,
    config = function()
      local trouble = require("trouble.providers.telescope")
      local telescope = require("telescope")

      telescope.setup({
        defaults = {
          mappings = {
            i = { ["<c-t>"] = trouble.open_with_trouble },
            n = { ["<c-t>"] = trouble.open_with_trouble },
          },
        },
      })

      local wk = require('which-key')
      wk.register({
        ['<leader>'] = {
          ['<leader>'] = { '<cmd>Telescope find_files<cr>', 'Find files' },
          [','] = { '<cmd>Telescope buffers<cr>', 'Change buffer' },
          ['.'] = { "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>", "File browser" },
          ['/'] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Search buffer" },
        },
        ['<leader>f'] = {
          f = { "<cmd>Telescope find_files<cr>", "Find file" },
          b = { "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>", "File browser" },
          s = { '<cmd>Telescope live_grep<cr>', 'Search files' },
          r = { "<cmd>Telescope oldfiles<cr>", "Search recent" },
        },
        ['<leader>b'] = {
          b = { '<cmd>Telescope buffers<cr>', 'Change buffer' },
          f = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Search buffer" },
        },
        ['<leader>h'] = {
          h = { '<cmd>Telescope help_tags<cr>', 'Help' },
          x = { '<cmd>Telescope commands<cr>', 'Commands' },
          k = { '<cmd>Telescope keymaps<cr>', 'Keymaps' },
          o = { '<cmd>Telescop vim_options<cr>', 'Options' },
        },
        ['<leader>g'] = {
          f = { '<cmd>Telescope git_files<cr>', 'Git files' },
          b = { '<cmd>Telescope git_branches<cr>', 'Git branches' },
        },
        ['<leader>s'] = {
          f = { '<cmd>Telescope live_grep<cr>', 'Search files (grep)' },
          g = { '<cmd>Telescope git_files<cr>', 'Search files (git)' },
          w = { '<cmd>Telescop grep_string<cr>', 'Search word' },
          r = { "<cmd>Telescope oldfiles<cr>", "Search recent" },
          d = { "<cmd>Telescope oldfiles<cr>", "Search diagnostics" },
        },
      })
    end,
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' }
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    event = "VeryLazy",
    config = function()
      local fb_actions = require "telescope._extensions.file_browser.actions"
      require('telescope').setup {
        extensions = {
          file_browser = {
            mappings = {
              ["i"] = {
                ["<c-r>"] = fb_actions.rename,
              },
            },
          },
        },
      }
      require("telescope").load_extension "file_browser"
    end,
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  },
}
