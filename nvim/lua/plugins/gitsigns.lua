return {
  {
    'lewis6991/gitsigns.nvim',
    event = 'BufRead',
    config = function()
      require('gitsigns').setup {
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns
          local wk = require('which-key')
          wk.register({
            [']g'] = {
              function()
                if vim.wo.diff then return ']g' end
                vim.schedule(function() gs.next_hunk() end)
                return '<Ignore>'
              end, 'Next git hunk', { expr = true, buffer = bufnr }
            },
            ['[g'] = {
              function()
                if vim.wo.diff then return '[g' end
                vim.schedule(function() gs.prev_hunk() end)
                return '<Ignore>'
              end, 'Previous git hunk', { expr = true, buffer = bufnr }
            },
          })
        end
      }
    end
  },
  {
    'petertriho/nvim-scrollbar',
    event = 'BufRead',
    config = function()
      require('scrollbar').setup()
      require("scrollbar.handlers.gitsigns").setup()
    end
  },
}
