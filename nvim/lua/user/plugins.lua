local packer, packer_bootstrap = require 'lib.packer-init'

packer.startup(function(use)
  use 'wbthomason/packer.nvim' -- Let Packer manage itself

  use 'christoomey/vim-tmux-navigator'
  use 'airblade/vim-rooter'
  use 'farmergreg/vim-lastplace'
  use 'andymass/vim-matchup'
  use 'tpope/vim-commentary'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'tpope/vim-eunuch'
  use 'tpope/vim-sleuth'

  use {
    'sonph/onehalf',
    rtp = 'vim',
    config = function()
      vim.cmd([[ colorscheme onehalfdark ]])
    end
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('user.plugins.nvim-tree')
    end
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/plenary.nvim'},
      { 'kyazdani42/nvim-web-devicons' },
      {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'},
    },
    config = function()
      require('user.plugins.telescope')
    end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('user.plugins.treesitter')
    end
  }

  use {
    'max397574/better-escape.nvim',
    config = function()
      require("better_escape").setup {
        mapping = {"kj"},
        timeout = vim.o.timeoutlen,
        clear_empty_lines = false,
        keys = "<esc>",
      }
    end,
  }

  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('user.plugins.gitsigns')
    end,
  }

  use {
    "folke/which-key.nvim",
    config = function()
      require('user.plugins.whichkey')
    end
  }

  use {
      'goolord/alpha-nvim',
      config = function ()
        require('user.plugins.alpha')
      end
  }

  -- TODO nvim-cmp
  -- TODO nvim-autopairs
  -- TODO configure LSP
  -- TODO lsp_signature
  -- TODO lspkind
  -- TODO nvim-dap
  -- TODO lightline or feline
  -- TODO indent-blankline (rainbow)
  -- TODO floatterm

  -- TODO fix coloring for:
  -- whichkey

  -- LATER
  -- vim fugitive?
  -- colorizer
  -- bufferline

  if packer_bootstrap then
    packer.sync()
  end
end)
