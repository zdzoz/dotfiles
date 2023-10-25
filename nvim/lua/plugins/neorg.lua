return {
  'nvim-neorg/neorg',
  build = ':Neorg sync-parsers',
  dependencies = { 'nvim-lua/plenary.nvim' },
  event = 'VeryLazy',
  config = function()
    require('neorg').setup {
      load = {
        ['core.defaults'] = {},    -- Loads default behaviour
        ['core.concealer'] = {},   -- Adds pretty icons to your documents
        ['core.dirman'] = {        -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = '~/notes',
            },
            default_workspace = 'notes',
          },
        },
        ['core.qol.toc'] = { config = { close_after_use = true } },
        ['core.completion'] = { config = { engine = 'nvim-cmp' }, name = '[Neorg]' },
        ['core.summary'] = {},
        -- ['core.ui.calendar'] = {},
        -- ['core.esupports.metagen'] = { config = { type = 'auto' } },
      },
    }
  end,
}
