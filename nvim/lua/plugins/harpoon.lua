return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
    config = function()
      local harpoon = require('harpoon')

      harpoon:setup()

      -- basic telescope configuration
      local conf = require("telescope.config").values
      local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end

        require("telescope.pickers").new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table({
            results = file_paths,
          }),
          previewer = conf.file_previewer({}),
          sorter = conf.generic_sorter({}),
        }):find()
      end

      local wk = require('which-key')
      wk.add({
        { '<leader>a', function() harpoon:list():add() end,             desc = 'Add buffer (harpoon)' },
        { '<leader>j',     function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = 'Toggle quick menu (harpoon)' },
        -- { '<C-h>',     function() toggle_telescope(harpoon:list()) end, desc = 'Open harpoon window' },

        { '<leader>1', function() harpoon:list():select(1) end,         desc = 'Go to harpoon 1' },
        { '<leader>2', function() harpoon:list():select(2) end,         desc = 'Go to harpoon 2' },
        { '<leader>3', function() harpoon:list():select(3) end,         desc = 'Go to harpoon 3' },
        { '<leader>4', function() harpoon:list():select(4) end,         desc = 'Go to harpoon 4' },

        -- -- Toggle previous & next buffers stored within Harpoon list
        -- { '<C-S-P>',   function() harpoon:list():prev() end,                        desc = '' },
        -- { '<C-S-N>',   function() harpoon:list():next() end,                        desc = '' }
      })
    end
  },
}
