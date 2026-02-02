function SET_MKPRG(str)
  if str then
    vim.g.Session_mkprg = str
    vim.o.makeprg = [[tmux neww "trap 'echo \"\"' INT; source ~/.zshrc; ]] ..
        vim.g.Session_mkprg .. [[; trap - INT; read -s -k '?Press any key to continue.'"]]
  end
end

return {
  {
    'rmagatti/auto-session',
    lazy = false,
    cond = not vim.g.vscode,
    config = function()
      vim.o.sessionoptions = "blank,buffers,curdir,folds,globals,help,tabpages,winsize,winpos,terminal,localoptions"
      require("auto-session").setup {
        log_level = "error",

        -- BEGIN -> Saving breakpoints
        save_extra_data = function(_)
          local ok, breakpoints = pcall(require, "dap.breakpoints")
          if not ok or not breakpoints then
            return
          end

          local bps = {}
          local breakpoints_by_buf = breakpoints.get()
          for buf, buf_bps in pairs(breakpoints_by_buf) do
            bps[vim.api.nvim_buf_get_name(buf)] = buf_bps
          end
          if vim.tbl_isempty(bps) then
            return
          end
          local extra_data = {
            breakpoints = bps,
          }
          return vim.fn.json_encode(extra_data)
        end,

        restore_extra_data = function(_, extra_data)
          local json = vim.fn.json_decode(extra_data)

          if json.breakpoints then
            local ok, breakpoints = pcall(require, "dap.breakpoints")

            if not ok or not breakpoints then
              return
            end
            vim.notify("restoring breakpoints")
            for buf_name, buf_bps in pairs(json.breakpoints) do
              for _, bp in pairs(buf_bps) do
                local line = bp.line
                local opts = {
                  condition = bp.condition,
                  log_message = bp.logMessage,
                  hit_condition = bp.hitCondition,
                }
                breakpoints.set(opts, vim.fn.bufnr(buf_name), line)
              end
            end
          end
        end,
        -- END -> Saving breakpoints

        pre_save_cmds = {
          function()
            if not vim.g.Session_mkprg then
              SET_MKPRG(vim.o.makeprg)
            end
          end
        },
        post_restore_cmds = {
          function()
            if vim.g.Session_mkprg then
              SET_MKPRG(vim.g.Session_mkprg)
            end
          end,
        },

        auto_session_suppress_dirs = { "~/", "~/Documents/Projects", "~/Downloads", "/" },
        session_lens = {
          load_on_setup = true,
          prompt_title = "Projects",
        },
      }

      -- vim.cmd [[cnoreabbrev <expr> make getcmdtype() == ":" && getcmdline() == 'make' ? 'silent make' : 'make']]
      -- vim.cmd [[cnoreabbrev <expr> mak getcmdtype() == ":" && getcmdline() == 'mak' ? 'silent make' : 'mak']]
      -- vim.cmd [[cnoreabbrev <expr> m getcmdtype() == ":" && getcmdline() == 'm' ? 'silent make' : 'm']]
      local wk = require('which-key')
      wk.add({
        { '<leader>ss', require("auto-session").search,                desc = 'Session' },
        { '<leader>sn', '<cmd>silent !tmux neww tmux-sessionizer<cr>', desc = 'New Session' },
        -- { '<leader>m',  '<cmd>silent make<cr>',                        desc = 'Make' },
        {
          '<leader>m',
          function()
            for _, buf in ipairs(vim.api.nvim_list_bufs()) do
              if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_name(buf):match("Make$") then
                vim.api.nvim_buf_delete(buf, { force = true })
              end
            end
            vim.cmd([[tab term ]] .. vim.g.Session_mkprg)
            vim.cmd('file Make')
            vim.cmd([[call feedkeys("G")]])
          end,
          desc = 'Make'
        },
        {
          '<leader>cm',
          function()
            vim.ui.input({ prompt = 'Make: ', default = vim.g.Session_mkprg }, function(input)
              SET_MKPRG(input)
            end)
          end,
          desc = 'Change makeprg'
        },
      })
    end
  },
}
