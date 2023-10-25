return {
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    config = function()
      local wk = require('which-key')
      wk.setup {
        triggers_blacklist = {
          c = { 'j', 'k' },
        },
      }
      wk.register({
        ['<leader>'] = {
          c = {
            name = '+code',
            w = { name = '+workspace' },
          },
          q = { name = '+quit' },
          w = { name = '+window' },
          b = { name = '+buffer' },
          h = { name = '+help' },
          s = { name = '+search' },
          g = { name = '+git' },
          f = {
            name = '+file',
            n = { '<cmd>enew<cr>', 'New File' },
          },
          x = { name = '+debug' },
        },
      })
    end
  },
}
