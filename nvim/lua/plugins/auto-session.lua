return {
  {
    'rmagatti/auto-session',
    lazy = false,
    dependencies = { 'rmagatti/auto-session', 'nvim-telescope/telescope.nvim' },
    config = function()
      vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
      require("auto-session").setup {
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
      }
    end
  },
  {
    'rmagatti/session-lens',
    event = "VeryLazy",
    config = function()
      local wk = require('which-key')
      wk.register({
        ['<leader>ss'] = { '<cmd>SearchSession<cr>', 'Session' },
      })
    end,
  },
}
