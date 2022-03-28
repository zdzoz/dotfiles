Plug 'mhinz/vim-startify'


" Startify
let g:startify_custom_header = ''
let g:startify_bookmarks = [ {'z': '~/.zshrc'},
      \ {'t': '~/.tmux.conf'},
      \ {'v': '~/.config/nvim/init.vim'},
      \ {'c': '~/.config/nvim/coc-settings.json'} ]

let g:startify_commands = [ {'p': 'PlugInstall'} ]
let g:startify_files_number = 4
let g:startify_lists = [
  \ { 'type': 'bookmarks',  'header':   ['  Bookmarks'        ] },
  \ { 'type': 'files',      'header':   ['  Recent'           ] },
  \ { 'type': 'dir',        'header':   ['  Current Directory'] },
  \ { 'type': 'commands',    'header':  ['  Commands'         ] },
  \ ]
