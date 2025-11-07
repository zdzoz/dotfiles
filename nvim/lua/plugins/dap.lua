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
        -- ensure_installed = { "c", "cpp", "python" },
        handlers = handlers,
      })

      require("dapui").setup()
      require("nvim-dap-virtual-text").setup({
        enabled = true,
        highlight_changed_variables = true,
        highlight_new_as_changed = false,
      })

      local wk = require('which-key')
      wk.add({
        { "<leader>d",  group = "debug" },
        { "<leader>b", "<cmd>lua require('dap').toggle_breakpoint()<CR>", desc = "toggle breakpoint" },
        -- { "<leader>B", "<cmd>lua require('dap').toggle_breakpoint()<CR>", desc = "toggle breakpoint" }, TODO: allow conditional breakpoints
        { "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<CR>", desc = "toggle breakpoint" },
        { "<leader>dc", "<cmd>lua require('dap').continue()<CR>",          desc = "continue" },
        { "<leader>dd", "<cmd>lua require('dap').toggle_breakpoint()<CR>", desc = "toggle breakpoint" },
        { "<leader>de", "<cmd>lua require('dapui').eval()<CR>",            desc = "eval" },
        { "<leader>di", "<cmd>lua require('dap').step_into()<CR>",         desc = "step into" },
        { "<leader>do", "<cmd>lua require('dap').step_over()<CR>",         desc = "step over" },
        { "<leader>dO", "<cmd>lua require('dap').step_out()<CR>",          desc = "step out" },
        { "<leader>dr", "<cmd>lua require('dap').repl.open()<CR>",         desc = "open repl" },
        { "<leader>dt", "<cmd>lua require('dapui').toggle()<CR>",          desc = "toggle ui" },
        { "<leader>m", require('dap').continue,                             desc = "Run" },
        { "<leader>M", require('dap').run_last,                            desc = "Run last build" },
      })
    end,
  },
  {
    'stevearc/overseer.nvim',
    opts = {},
  },
}
