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
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {},
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = 'ibl',
    event = 'VeryLazy',
    opts = {},
    config = function()
      local highlight = {
        "RainbowRed",
        "RainbowYellow",
        "RainbowBlue",
        "RainbowOrange",
        "RainbowGreen",
        "RainbowViolet",
        "RainbowCyan",
      }

      local hooks = require "ibl.hooks"

      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
      end)

      -- vim.g.rainbow_delimiters = { highlight = highlight }
      require("ibl").setup { scope = { highlight = highlight } }

      -- hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end
  },
  {
    'nmac427/guess-indent.nvim',
    config = function() require('guess-indent').setup {} end,
  },
  {
    'folke/todo-comments.nvim',
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
  { 'stevearc/dressing.nvim', event = "VeryLazy" },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local wk = require('which-key')
      wk.register({
        ['<C-->'] = { mode = { 'n', 't' }, '<cmd>ToggleTerm<cr>', 'Toggle Terminal' },
        ['<leader>x'] = {
          x = { '<cmd>TroubleToggle<cr>', 'Trouble' },
          w = { '<cmd>TroubleToggle workspace_diagnostics<cr>', 'Trouble: Workspace' },
          d = { '<cmd>TroubleToggle document_diagnostics<cr>', 'Trouble: Document' },
          q = { '<cmd>TroubleToggle quickfix<cr>', 'Trouble: Quickfix' },
          l = { '<cmd>TroubleToggle loclist<cr>', 'Trouble: Loclist' },
        },
        g = {
          r = { '<cmd>TroubleToggle lsp_references<cr>', 'Trouble: References' },
        },
      })
    end,
  },
  { "folke/neodev.nvim",      opts = {} },
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function() require("toggleterm").setup { open_mapping = [[<c-/>]], } end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  -- {
  --   "christoomey/vim-tmux-navigator",
  --   event = "VeryLazy",
  -- },
  {
    'mrjones2014/smart-splits.nvim',
    event = "VeryLazy",
    config = function()
      local ss = require('smart-splits')
      ss.setup({
        default_amount = 10,
      })
      vim.keymap.set('n', '<c-,>', ss.resize_left)
      vim.keymap.set('n', '<c-.>', ss.resize_right)
      vim.keymap.set('n', '<c-->', ss.resize_down)
      vim.keymap.set('n', '<c-=>', ss.resize_up)
      vim.keymap.set('n', '<c-h>', ss.move_cursor_left)
      vim.keymap.set('n', '<c-j>', ss.move_cursor_down)
      vim.keymap.set('n', '<c-k>', ss.move_cursor_up)
      vim.keymap.set('n', '<c-l>', ss.move_cursor_right)
    end,
  },
}
