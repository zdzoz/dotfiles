return {
  {
    "folke/neodev.nvim",
    priority = 1000,
    config = function()
      require("neodev").setup({
        library = { plugins = { "nvim-dap-ui" }, types = true },
      })
    end,
  },
  {
    'neovim/nvim-lspconfig',
    priority = 999,
    lazy = false,
    dependencies = { 'simrat39/rust-tools.nvim', 'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim', 'hrsh7th/nvim-cmp', 'hrsh7th/cmp-nvim-lsp' },
    keys = {
      { '<leader>cM', '<cmd>Mason<cr>', desc = 'Mason' },
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- GLSL
      vim.lsp.config('glsl_analyzer', {
        capabilities = capabilities,
      })

      -- sourcekit
      vim.lsp.config('sourcekit', {
        capabilities = capabilities,
        filetypes = { "swift" },
      })

      -- CLANGD
      vim.lsp.config('clangd', {
        capabilities = capabilities,
        cmd = {
          'clangd',
          '--background-index',
          '--clang-tidy',
          '--completion-style=bundled',
          '--offset-encoding=utf-16',
          -- '--header-insertion=iwyu',
          '--header-insertion=never',
          '--pch-storage=memory',
          -- '--clang-tidy-checks=-*,bugprone-*,clang-analyzer-*,cppcoreguidelines-*,modernize-*,performance-*,readability-*'
          '--fallback-style=WebKit',
        },
      })

      -- LUA
      vim.lsp.config('lua_ls', {
        capabilities = capabilities,
        on_init = function(client)
          if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if
                path ~= vim.fn.stdpath('config')
                and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
            then
              return
            end
          end

          local libs = {}

          local buf = vim.api.nvim_get_current_buf()
          local name = vim.api.nvim_buf_get_name(buf)

          if name:match("premake5%.lua$") then
            table.insert(libs, vim.fs.joinpath(vim.fn.stdpath("config"), "premake5-definitions.lua"))
          end

          local unpack = table.unpack or unpack

          client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
              version = 'LuaJIT',
              path = {
                'lua/?.lua',
                'lua/?/init.lua',
              },
            },
            telemetry = { enable = false },
            hint = { enable = true },
            workspace = {
              checkThirdParty = false,
              library = {
                vim.env.VIMRUNTIME,
                unpack(libs)
              }
            }
          })
        end,
        on_new_config = function(new_config, root_dir)
          local buf = vim.api.nvim_get_current_buf()
          local name = vim.api.nvim_buf_get_name(buf)

          if name:match("premake5%.lua$") then
            table.insert(new_config.settings.Lua.workspace.library, vim.fs.joinpath(vim.fn.stdpath("config"), "premake5-definitions.lua"))
          end

        end,
        settings = {
          Lua = {},
        },
      })

      require('mason').setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          },
        },
      })

      require('mason-lspconfig').setup({
        ensure_installed = {
          'clangd', 'lua_ls', 'pyright'
        },
      })

      vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic' })
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic' })
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })
      -- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          -- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = ev.buf, desc = 'Go to declaration' })
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = ev.buf, desc = 'Go to definition' })
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = ev.buf })
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = ev.buf, desc = 'Go to implementation' })
          vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { buffer = ev.buf })
          vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, { buffer = ev.buf })
          vim.keymap.set('n', '<leader>cwa', vim.lsp.buf.add_workspace_folder,
            { buffer = ev.buf, desc = 'Add workspace folder' })
          vim.keymap.set('n', '<leader>cwr', vim.lsp.buf.remove_workspace_folder,
            { buffer = ev.buf, desc = 'Remove workspace folder' })
          vim.keymap.set('n', '<leader>cwl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
            { buffer = ev.buf, desc = 'List workspace folders' })
          vim.keymap.set('n', '<leader>cd', vim.lsp.buf.type_definition,
            { buffer = ev.buf, desc = 'See type definition' })
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = ev.buf, desc = 'Rename' })
          vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { buffer = ev.buf, desc = 'Code action' })
          vim.keymap.set('n', 'gR', '<cmd>Telescope lsp_references<cr>', { buffer = ev.buf, desc = 'List references' })

          local lang_t = {
            ['python'] = function()
              vim.keymap.set('n', '<leader>cf', function() vim.cmd('silent !black %') end,
                { buffer = ev.buf, desc = 'Format code' })
            end,
            ['swift'] = function()
              vim.keymap.set('n', '<leader>cf',
                function()
                  vim.cmd('silent !swift-format -i --configuration ' ..
                    vim.fn.stdpath('config') .. '/swift-format-config.json' .. ' %')
                end,
                { buffer = ev.buf, desc = 'Format code' })
            end,
          }

          local f = lang_t[vim.bo[ev.buf].filetype]
          if f then
            f()
          else
            vim.keymap.set('n', '<leader>cf', function() vim.lsp.buf.format { async = true } end,
              { buffer = ev.buf, desc = 'Format code' })
          end

          if vim.lsp.inlay_hint then
            vim.keymap.set('n', '<leader>ch', function() vim.lsp.inlay_hint(0, nil) end, { desc = 'Toggle inlay hints' })
          end
        end,
      })
    end,
  },
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = "LspAttach",
    opts = {},
  },
}
