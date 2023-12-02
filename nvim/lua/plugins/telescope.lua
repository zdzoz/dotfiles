return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    lazy = false,
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons', "nvim-telescope/telescope-file-browser.nvim" },
    config = function()
      local trouble = require("trouble.providers.telescope")
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")
      local themes = require("telescope.themes")
      local actions = require("telescope.actions")
      local exts = telescope.extensions
      local fb_actions = exts.file_browser.actions

      telescope.setup({
        defaults = {
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden",
            "--glob",
            "!**/.git/*",
          },
          borderchars = {
            { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
            prompt = { " ", " ", " ", " ", ' ', ' ', " ", " " },
            results = { " ", " ", " ", " ", " ", " ", " ", " " },
            preview = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },

          },
          selection_caret = "● ",
          mappings = {
            i = {
              ["<c-t>"] = trouble.open_with_trouble,
              ["<c-u>"] = false,
            },
            n = {
              ["<c-t>"] = trouble.open_with_trouble,
            },
          },
        },
        pickers = {
          find_files = {
            find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
          },
          buffers = {
            sort_lastused = true,
            mappings = {
              i = {
                ["<c-d>"] = actions.delete_buffer,
              },
              n = {
                ["<c-d>"] = actions.delete_buffer,
              },
            },
          },
          man_pages = {
            sections = { "ALL" },
          },
        },
        extensions = {
          file_browser = {
            mappings = {
              ["i"] = {
                ["<c-r>"] = fb_actions.rename,
                ["<c-d>"] = fb_actions.remove,
                ["<c-y>"] = fb_actions.copy,
              },
            },
          },
        }
      })
      telescope.load_extension("file_browser")

      local def_prev = function()
        return {
          layout_config = {
            height = 0.7,
            width = 0.7,
            preview_width = 0.5,
          },
          prompt_title = false,
        }
      end

      local file_prev = function()
        return themes.get_ivy({
          layout_config = {
            height = 0.25
          },
          border = false,
          previewer = false,
          prompt_title = false,
        })
      end

      local fb_prev = function()
        return themes.get_ivy({
          path = "%:p:h",
          select_buffer = true,

          layout_config = {
            height = 0.25
          },
          border = false,
          previewer = false,
          prompt_title = false,
        })
      end

      local prompt = "#313244";
      local main = "#1d1d2d";

      local TelescopePrompt = {
        TelescopeSelection = {
          bg = "#242434",
        },
        TelescopePromptNormal = {
          bg = prompt,
        },
        TelescopePromptBorder = {
          bg = prompt,
        },
        TelescopePromptTitle = {
          fg = prompt,
          bg = prompt,
        },
        TelescopePreviewNormal = {
          -- fg = crust,
          bg = main,
        },
        TelescopePreviewBorder = {
          fg = main,
          bg = main,
        },
        TelescopePreviewTitle = {
          fg = main,
          bg = main,
        },
        TelescopeResultsNormal = {
          bg = main,
        },
        TelescopeResultsBorder = {
          fg = main,
          bg = main,
        },
        TelescopeResultsTitle = {
          fg = main,
          bg = main,
        },
      }

      for hl, col in pairs(TelescopePrompt) do
        vim.api.nvim_set_hl(0, hl, col)
      end

      local wk = require('which-key')
      wk.register({
        ['<leader>'] = {
          ['<leader>'] = { function() builtin.find_files(file_prev()) end, 'Find files' },
          [','] = { function() builtin.buffers(file_prev()) end, 'Change buffer' },
          ['.'] = { function() exts.file_browser.file_browser(fb_prev()) end, "File browser" },
          ['/'] = { function() builtin.current_buffer_fuzzy_find(def_prev()) end, "Search buffer" },
        },
        ['<leader>f'] = {
          -- TODO: if in git dir, use git_files?
          f = { function() builtin.find_files(file_prev()) end, "Find file" },
          b = { function() exts.file_browser.file_browser(fb_prev()) end, "File browser" },
          r = { function() builtin.oldfiles(def_prev()) end, "Search recent" },
        },
        ['<leader>b'] = {
          b = { function() builtin.buffers(file_prev()) end, 'Change buffer' },
          f = { function() builtin.current_buffer_fuzzy_find() end, "Search buffer" },
        },
        ['<leader>h'] = {
          h = { function() builtin.help_tags(def_prev()) end, 'Help' },
          x = { function() builtin.commands(def_prev()) end, 'Commands' },
          k = { function() builtin.keymaps(def_prev()) end, 'Keymaps' },
          o = { function() builtin.vim_options(def_prev()) end, 'Options' },
          m = { function() builtin.man_pages(def_prev()) end, 'Man pages' },
        },
        ['<leader>g'] = {
          f = { function() builtin.git_files(file_prev()) end, 'Git files' },
          b = { function() builtin.git_branches(file_prev()) end, 'Git branches' },
        },
        ['<leader>s'] = {
          f = { function() builtin.live_grep(def_prev()) end, 'Search files' },
          -- w = { function() builtin.grep_string({ search = vim.fn.input("Search Word: ") }) end, 'Search word' },
          r = { function() builtin.oldfiles(def_prev()) end, "Search recent" },
          d = { function() builtin.diagnostics(file_prev()) end, "Search diagnostics" },
          b = { function() builtin.current_buffer_fuzzy_find(def_prev()) end, "Search buffer" },
        },
      })
    end,
  },
}
