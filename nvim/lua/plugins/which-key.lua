return {
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    config = function()
      local wk = require('which-key')
      -- wk.setup {
      --   triggers_blacklist = {
      --     c = { 'j', 'k' },
      --   },
      -- }
      wk.add({
        { "<leader>b", desc = "buffer" },
        { "<leader>c", desc = "code" },
        { "<leader>cw", desc = "workspace" },
        { "<leader>f", desc = "file" },
        { "<leader>fn", "<cmd>enew<cr>", desc = "New File" },
        { "<leader>g", desc = "git" },
        { "<leader>h", desc = "help" },
        { "<leader>q", desc = "quit" },
        { "<leader>s", desc = "search" },
        { "<leader>w", desc = "window" },
        { "<leader>x", desc = "trouble" },
      })
    end
  },
}
