return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
    config = function()
      local wk = require("which-key")
      wk.register({
        ["<leader>"] = {
          q = { name = "quit" },
          w = { name = "+window" },
        },
      })
    end
  },
}
