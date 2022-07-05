require("which-key").setup {
  triggers_blacklist = {
    i = { '{', ',', ';'}
  },
}

local wk = require('which-key')

wk.register({
  ['<space>'] = 'Motion',
  f = 'Find Files',
  F = 'All Files',
  r = 'Search',
  b = 'Buffers',
  g = 'Git Branches',
  h = 'History',
  m = 'Maximize',
  n = 'File Explorer',
  Q = 'Close Buffer',
}, { prefix = '<leader>' })
