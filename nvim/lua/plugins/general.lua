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
    event = "BufRead",
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
    "folke/trouble.nvim",
    -- dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    cmd = "Trouble",
    keys = {
      {
        '<leader>xa',
        '<cmd>Trouble<cr>',
        desc = "All Diagnostics (Trouble)"
      },

      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
      {
        "gr",
        "<cmd>Trouble lsp_references<cr>",
        desc = "References (Trouble)",
      },
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  {
    'mrjones2014/smart-splits.nvim',
    config = function()
      local ss = require('smart-splits')
      ss.setup({
        default_amount = 10,
      })
      vim.keymap.set('n', '<c-]>', ss.resize_left, { desc = "Resize left" })
      vim.keymap.set('n', '<c-\\>', ss.resize_right, { desc = "Resize right" })
      vim.keymap.set('n', '<c-->', ss.resize_down, { desc = "Resize down" })
      vim.keymap.set('n', '<c-=>', ss.resize_up, { desc = "Resize up" })
      vim.keymap.set('n', '<c-h>', ss.move_cursor_left, { desc = "Move cursor left" })
      vim.keymap.set('n', '<c-l>', ss.move_cursor_right, { desc = "Move cursor right" })
      vim.keymap.set('n', '<c-k>', ss.move_cursor_up, { desc = "Move cursor up" })
      vim.keymap.set('n', '<c-j>', ss.move_cursor_down, { desc = "Move cursor down" })
    end,
  },
  { 'JoosepAlviste/nvim-ts-context-commentstring' },
}
