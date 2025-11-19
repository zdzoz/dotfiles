return {
  {
    'mfussenegger/nvim-dap',
    dependencies = { 'jay-babu/mason-nvim-dap.nvim', 'nvim-neotest/nvim-nio', 'rcarriga/nvim-dap-ui', 'igorlfs/nvim-dap-view', 'theHamsta/nvim-dap-virtual-text' },
    config = function()
      local dap, dapui, dapview = require("dap"), require("dapui"), require('dap-view')
      dapui.setup()
      dapview.setup({
        windows = {
          terminal = {
            position = "right",
            start_hidden = false
          }
        }
      })
      require("nvim-dap-virtual-text").setup()
      -- {
      --   enabled = true,
      --   highlight_changed_variables = true,
      --   highlight_new_as_changed = false,
      -- }

      -- TODO: check OS
      dap.defaults.fallback.external_terminal = { -- not working?
        command = '/Applications/Ghostty.app/Contents/MacOS/ghostty',
        args = { '-e' },
      }
      dap.defaults.fallback.terminal_win_cmd = 'tabnew'
      -- dap.defaults.fallback.focus_terminal = true
      -- dap.defaults.fallback.force_external_terminal = true

      local handlers = {
        function(config)
          require('mason-nvim-dap').default_setup(config)
        end,
      }

      require("mason-nvim-dap").setup({
        -- ensure_installed = { "c", "cpp", "python" },
        handlers = handlers,
      })

      local open = function() dapview.open() end
      local close = function()
        dapui.close()
        dapview.close()

        -- find name of buf in window in cur tab and if it is a dap-terminal close it
        local current_tab = vim.api.nvim_get_current_tabpage()
        local wins = vim.api.nvim_tabpage_list_wins(current_tab)

        for _, win in ipairs(wins) do
          local buf = vim.api.nvim_win_get_buf(win)
          local name = vim.api.nvim_buf_get_name(buf)
          if name:match("%[dap%-terminal%]") then
            pcall(vim.api.nvim_win_close, win, true)
          end
        end
      end

      local wk = require('which-key')
      wk.add({
        { "<leader>d",  group = "debug" },
        { "<leader>b",  "<cmd>lua require('dap').toggle_breakpoint()<CR>", desc = "toggle breakpoint" },
        -- { "<leader>B", "<cmd>lua require('dap').toggle_breakpoint()<CR>", desc = "toggle breakpoint" }, TODO: allow conditional breakpoints
        { "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<CR>", desc = "toggle breakpoint" },
        { "<leader>dc", "<cmd>lua require('dap').continue()<CR>",          desc = "continue" },
        { "<leader>dd", "<cmd>lua require('dap').toggle_breakpoint()<CR>", desc = "toggle breakpoint" },
        { "<leader>di", "<cmd>lua require('dap').step_into()<CR>",         desc = "step into" },
        { "<leader>do", "<cmd>lua require('dap').step_over()<CR>",         desc = "step over" },
        { "<leader>dO", "<cmd>lua require('dap').step_out()<CR>",          desc = "step out" },
        { "<leader>dr", "<cmd>lua require('dap').repl.toggle()<CR>",       desc = "open repl" },
        {
          "<leader>ds",
          function()
            dap.terminate()
            close()
          end,
          desc = "Stop"
        },
        { "<leader>m",  dap.continue,                 desc = "Run" },
        -- { "<leader>M",  dap.run_last,                             desc = "Run last build" }, // conflicts with :make


        { "<leader>du", require('dap-view').toggle,   desc = "toggle ui" },
        { "<leader>dw", require('dap-view').add_expr, desc = "Add to watchlist" },

        { "<leader>dt", require('dapui').toggle,      desc = "toggle ui" },
        { "<leader>de", require('dapui').eval,        desc = "eval" },

        { "<leader>o",  require('overseer').toggle,   desc = "Toggle overseer" }
      })

      -- automatically open debug ui when debugging
      dap.listeners.before.attach.dapui_config = function()
        open()
      end
      dap.listeners.before.launch.dapui_config = function()
        open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        close()
      end

    end,
  },
  {
    'stevearc/overseer.nvim',
    opts = {
      task_list = {
        direction = "left",
        bindings = {
          ["o"] = "OpenFloat",
        }
      }
    },
  },
}
