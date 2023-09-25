return {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup {
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local wk = require('which-key')
        wk.register({
          [']c'] = {
            function()
              if vim.wo.diff then return ']c' end
              vim.schedule(function() gs.next_hunk() end)
              return '<Ignore>'
            end, 'Next git hunk', { expr = true, buffer = bufnr }
          },
          ['[c'] = {
            function()
              if vim.wo.diff then return '[c' end
              vim.schedule(function() gs.prev_hunk() end)
              return '<Ignore>'
            end, 'Previous git hunk', { expr = true, buffer = bufnr }
          },
        })
      end
    }
  end
}
