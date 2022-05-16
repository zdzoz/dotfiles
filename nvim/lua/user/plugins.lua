local packer, packer_bootstrap = require 'lib.packer-init'

packer.startup(function(use)
  use 'wbthomason/packer.nvim' -- Let Packer manage itself

  use 'christoomey/vim-tmux-navigator'
  use 'airblade/vim-rooter'
  use 'farmergreg/vim-lastplace'
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

  -- TODO configure LSP
  -- TODO nvim-dap
  -- TODO floatterm?
  -- TODO lightline
  -- TODO indent-blankline (rainbow)
  -- TODO gitsigns
  -- TODO vim fugitive?

  if packer_bootstrap then
    packer.sync()
  end
end)
