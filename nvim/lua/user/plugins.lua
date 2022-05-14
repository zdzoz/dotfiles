local packer = require 'lib.packer-init'

packer.startup(function(use)
  use 'wbthomason/packer.nvim' -- Let Packer manage itself
  use 'tpope/vim-sleuth'
  use 'airblade/vim-rooter'
  use 'farmergreg/vim-lastplace'
  use 'tpope/vim-commentary'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'tpope/vim-eunuch'

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

  if packer_bootstrap then
    packer.sync()
  end
end)
