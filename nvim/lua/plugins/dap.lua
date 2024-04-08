return {
  {
    'mfussenegger/nvim-dap',
    dependencies = { 'jay-babu/mason-nvim-dap.nvim', 'nvim-neotest/nvim-nio', 'rcarriga/nvim-dap-ui', 'theHamsta/nvim-dap-virtual-text' },
    config = function()
      local handlers = {
        function(config)
          require('mason-nvim-dap').default_setup(config)
        end,
      }

      require("mason-nvim-dap").setup({
        ensure_installed = { "c", "cpp", "python" },
        handlers = handlers,
      })
      require("dapui").setup()
      require("nvim-dap-virtual-text").setup({
        enabled = true,
        highlight_changed_variables = true,
        highlight_new_as_changed = false,
      })

      local wk = require('which-key')
      wk.register({
        ['<leader>d'] = {
          name = "+debug",
          b = { "<cmd>lua require('dap').toggle_breakpoint()<CR>", "toggle breakpoint" },
          c = { "<cmd>lua require('dap').continue()<CR>", "continue" },
          i = { "<cmd>lua require('dap').step_into()<CR>", "step into" },
          o = { "<cmd>lua require('dap').step_over()<CR>", "step over" },
          O = { "<cmd>lua require('dap').step_out()<CR>", "step out" },
          r = { "<cmd>lua require('dap').repl.open()<CR>", "open repl" },
          t = { "<cmd>lua require('dapui').toggle()<CR>", "toggle ui" },
          e = { "<cmd>lua require('dapui').eval()<CR>", "eval" },
          d = { "<cmd>lua require('dapui').eval()<CR>", "eval" },
        },
      })
    end,
  },
}
