function SET_MKPRG(str)
  if str then
    vim.g.Session_mkprg = str
    vim.o.makeprg = [[tmux neww "trap 'echo \"\"' INT; source ~/.zshrc; ]] .. vim.g.Session_mkprg .. [[; trap - INT; read -s -k '?Press any key to continue.'"]]
  end
end
return {
  {
    'rmagatti/auto-session',
    lazy = false,
    dependencies = { 'nvim-telescope/telescope.nvim' },
    config = function()
      vim.o.sessionoptions = "blank,buffers,curdir,folds,globals,help,tabpages,winsize,winpos,terminal,localoptions"
      require("auto-session").setup {
        log_level = "error",
        pre_save_cmds = {
          function()
            if not vim.g.Session_mkprg then
              SET_MKPRG(vim.o.makeprg)
            end
          end
        },
        post_restore_cmds = { function()
          if vim.g.Session_mkprg then
            SET_MKPRG(vim.g.Session_mkprg)
          end
          -- vim.g.Session_mkprg = nil
        end,
        },
        -- auto_session_enable_last_session = vim.loop.cwd() == vim.loop.os_homedir(),
        auto_session_suppress_dirs = { "~/", "~/Documents/Projects", "~/Downloads", "/" },
        session_lens = {
          load_on_setup = true,
          prompt_title = "Projects",
        },
      }


      vim.cmd [[cnoreabbrev <expr> make getcmdtype() == ":" && getcmdline() == 'make' ? 'silent make' : 'make']]
      vim.cmd [[cnoreabbrev <expr> mak getcmdtype() == ":" && getcmdline() == 'mak' ? 'silent make' : 'mak']]
      vim.cmd [[cnoreabbrev <expr> m getcmdtype() == ":" && getcmdline() == 'm' ? 'silent make' : 'm']]
      local wk = require('which-key')
      wk.register({
        ['<leader>ss'] = { require("auto-session.session-lens").search_session, 'Session' },
        ['<leader>sn'] = { '<cmd>silent !tmux neww tmux-sessionizer<cr>', 'New Session' },
        ['<leader>m'] = { '<cmd>silent make<cr>', 'Make' },
        ['<leader>cm'] = { function()
          vim.ui.input({ prompt = 'Make: ', default = vim.g.Session_mkprg }, function(input)
            SET_MKPRG(input)
          end)
        end, 'Change makeprg' },
      })
    end
  },
}
