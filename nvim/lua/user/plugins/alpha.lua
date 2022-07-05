local alpha = require'alpha'
local dashboard = require'alpha.themes.dashboard'
dashboard.section.header.val = {
   [[                               __                ]],
   [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
   [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
   [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
   [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
   [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}
dashboard.section.buttons.val = {
   dashboard.button( "e", "  New file" , ":ene <BAR> startinsert <CR>"),
   dashboard.button( "p", "Open nvim plugins" , ":e ~/.config/nvim/lua/user/plugins.lua<cr>"),
   dashboard.button( "z", "Open zshrc" , ":e ~/.zshrc<cr>"),
   dashboard.button( "t", "Open tmux.conf" , ":e ~/.tmux.conf<cr>"),
   dashboard.button( "s", "痢 Sync Plugins" , ":PackerSync<cr>"),
   dashboard.button( "q", "  Quit" , ":qa<CR>"),
}

dashboard.config.opts.noautocmd = true

alpha.setup(dashboard.config)
