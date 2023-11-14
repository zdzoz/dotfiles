return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
    config = function()
      local configs = require('nvim-treesitter.configs')
      configs.setup({
        ensure_installed = {
          'lua', 'vim', 'vimdoc', 'query',
          'c', 'cpp', 'cmake', 'glsl',
          'javascript', 'html',
          'python',
        },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
        textobjects = {
          lsp_interop = {
            enable = true,
            border = 'none',
            floating_preview_opts = {},
            peek_definition_code = {
              ['<leader>df'] = '@function.outer',
              ['<leader>dF'] = '@class.outer',
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              [']m'] = '@function.outer',
              [']c'] = { query = '@class.outer', desc = 'Next class start' },
            },
            goto_next_end = {
              [']M'] = '@function.outer',
              [']['] = '@class.outer',
            },
            goto_previous_start = {
              ['[m'] = '@function.outer',
              ['[['] = '@class.outer',
            },
            goto_previous_end = {
              ['[M'] = '@function.outer',
              ['[c'] = '@class.outer',
            },
            goto_next = {
              [']]'] = { query = '@scope', query_group = 'locals', desc = 'Next scope' },
              [']f'] = '@function.outer',
              [']d'] = '@conditional.outer',
            },
            goto_previous = {
              ['[['] = { query = '@scope', query_group = 'locals', desc = 'Previous scope' },
              ['[f'] = '@function.outer',
              ['[d'] = '@conditional.outer',
            }
          },
        },
      })
    end
  },
  {
    'nvim-treesitter/playground',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    event = 'VeryLazy',
    config = function()
      require 'nvim-treesitter.configs'.setup {
        playground = {
          enable = true,
          disable = {},
          updatetime = 25,   -- Debounced time for highlighting nodes in the playground from source code
          persist_queries = false, -- Whether the query persists across vim sessions
          keybindings = {
            toggle_query_editor = 'o',
            toggle_hl_groups = 'i',
            toggle_injected_languages = 't',
            toggle_anonymous_nodes = 'a',
            toggle_language_display = 'I',
            focus_language = 'f',
            unfocus_language = 'F',
            update = 'R',
            goto_node = '<cr>',
            show_help = '?',
          },
        }
      }
    end
  }
}
