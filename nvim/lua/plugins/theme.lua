return {
  -- rose pine
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require('rose-pine').setup({
        highlight_groups = {
          StatusLine = { fg = "love", bg = "love", blend = 10 },
          StatusLineNC = { fg = "subtle", bg = "surface" },
          TelescopeBorder = { fg = "highlight_high", bg = "none" },
          TelescopeNormal = { bg = "none" },
          TelescopePromptNormal = { bg = "base" },
          TelescopeResultsNormal = { fg = "subtle", bg = "none" },
          TelescopeSelection = { fg = "text", bg = "base" },
          TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
          WhichKeyNormal = { bg = "overlay", fg = "subtle" },
        },
      })

      vim.cmd.colorscheme("rose-pine")
    end,
  },
  -- catppuccin
  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   lazy = false,
  --   -- config = function()
  --   --   vim.cmd.colorscheme("catppuccin")
  --   -- end,
  --   opts = {
  --     integrations = {
  --       alpha = true,
  --       cmp = true,
  --       flash = true,
  --       gitsigns = true,
  --       illuminate = true,
  --       indent_blankline = { enabled = true },
  --       lsp_trouble = true,
  --       mason = true,
  --       mini = true,
  --       native_lsp = {
  --         enabled = true,
  --         underlines = {
  --           errors = { "undercurl" },
  --           hints = { "undercurl" },
  --           warnings = { "undercurl" },
  --           information = { "undercurl" },
  --         },
  --       },
  --       navic = { enabled = true, custom_bg = "lualine" },
  --       neotest = true,
  --       noice = true,
  --       notify = true,
  --       neotree = true,
  --       semantic_tokens = true,
  --       telescope = true,
  --       treesitter = true,
  --       which_key = true,
  --     },
  --   },
  -- },
}
