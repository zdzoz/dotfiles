return {
  -- catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function() vim.cmd.colorscheme "catppuccin" end,
    opts = {
      integrations = {
        alpha = true,
        cmp = true,
        flash = true,
        gitsigns = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        lsp_trouble = true,
        mason = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        noice = true,
        notify = true,
        neotree = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        which_key = true,
      },
    },
  },
  {
    "christoomey/vim-tmux-navigator",
    priority = 9999,
    lazy = false,
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {},
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = 'VeryLazy',
    opts = {
      show_current_context = true,
      -- show_current_context_start = true,
    },
  },
  {
    'nmac427/guess-indent.nvim',
    config = function() require('guess-indent').setup {} end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    opts = {},
    keys = {
      { '<leader>ct', mode = 'n', '<cmd>TodoTelescope<cr>',                            desc = 'Todos' },
      { ']t',         mode = 'n', function() require("todo-comments").jump_next() end, desc = 'Next todo comment' },
      { '[t',         mode = 'n', function() require("todo-comments").jump_prev() end, desc = 'Previous todo comment' },
    },
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "o", "x" }, function() require("flash").jump() end,       desc = "Flash" },
      { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o",               function() require("flash").remote() end,     desc = "Remote Flash" },
      {
        "R",
        mode = { "o", "x" },
        function() require("flash").treesitter_search() end,
        desc =
        "Treesitter Search"
      },
      {
        "<c-s>",
        mode = { "c" },
        function() require("flash").toggle() end,
        desc =
        "Toggle Flash Search"
      },
    },
  },
  -- {
  --   'glepnir/dashboard-nvim',
  --   event = 'VimEnter',
  --   opts = {
  --     theme = 'doom',
  --     shortcut_type = 'letter',
  --     config = {
  --       week_header = {
  --         enable = true,
  --       },
  --       center = {
  --         {
  --           icon = ' ',
  --           -- icon_hl = 'Title',
  --           desc = 'Find File',
  --           -- desc_hl = 'String',
  --           -- key = 'l',
  --           keymap = 'SPC l',
  --           -- key_hl = 'Title',
  --         },
  --         {
  --           icon = ' ',
  --           icon_hl = 'Title',
  --           desc = 'Lazy',
  --           -- desc_hl = 'String',
  --           key = 'SPC l',
  --           keymap = 'SPC l',
  --           key_hl = 'Title',
  --         },
  --       },
  --       -- footer = {},
  --     },
  --     preview = {
  --       -- command = false,
  --       -- file_path     -- preview file path
  --       -- file_height   -- preview file height
  --       -- file_width    -- preview file width
  --     },
  --   },
  --   dependencies = { {'nvim-tree/nvim-web-devicons'}}
  -- },
  { 'stevearc/dressing.nvim', event = "VeryLazy" },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local wk = require('which-key')
      wk.register({
        ['<leader>x'] = {
          x = { '<cmd>TroubleToggle<cr>', 'Trouble' },
          w = { '<cmd>TroubleToggle workspace_diagnostics<cr>', 'Trouble: Workspace' },
          d = { '<cmd>TroubleToggle document_diagnostics<cr>', 'Trouble: Document' },
          q = { '<cmd>TroubleToggle quickfix<cr>', 'Trouble: Quickfix' },
          l = { '<cmd>TroubleToggle loclist<cr>', 'Trouble: Loclist' },
        },
        g = {
          R = { '<cmd>TroubleToggle lsp_references<cr>', 'Trouble: References' },
        },
      })
    end,
  },
  { "folke/neodev.nvim", opts = {} },
}
