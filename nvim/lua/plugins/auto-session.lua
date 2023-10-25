return {
  {
    'rmagatti/auto-session',
    lazy = false,
    dependencies = { 'nvim-telescope/telescope.nvim' },
    config = function()
      vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
      require("auto-session").setup {
        log_level = "error",
        -- auto_session_enable_last_session = vim.loop.cwd() == vim.loop.os_homedir(),
        auto_session_suppress_dirs = { "~/", "~/Documents/Projects", "~/Downloads", "/" },
        session_lens = {
          load_on_setup = true,
        },
      }

      -- require("telescope").load_extension "session-lens"
      local wk = require('which-key')
      wk.register({
        ['<leader>ss'] = { require("auto-session.session-lens").search_session, 'Session' },
      })
    end
  },
}
