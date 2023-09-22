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
  {
    'numToStr/Comment.nvim',
    opts = {},
    lazy = false,
  },
}
