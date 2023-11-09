return {
  {
    'github/copilot.vim',
    event = 'VeryLazy',
    config = function()
      vim.cmd[[
        silent Copilot setup
        imap <silent><script><expr> <s-cr> copilot#Accept("\<CR>")
        let g:copilot_no_tab_map = v:true
      ]]
    end
  },
  {
    'hrsh7th/nvim-cmp',
    event = "LspAttach",
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-path', 'saadparwaiz1/cmp_luasnip', 'L3MON4D3/LuaSnip' },
    config = function()
      local luasnip = require 'luasnip'

      -- nvim-cmp setup
      local cmp = require 'cmp'
      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
          ['<C-d>'] = cmp.mapping.scroll_docs(4),  -- Down
          -- C-b (back) C-f (forward) for snippet placeholder navigation.
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
          { name = 'neorg' },
        },
      }
    end,
  },
}
