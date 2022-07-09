Plug 'mhinz/vim-startify'


" Startify
let g:startify_custom_header = ''

" Prevent startify from changing directories
let g:startify_change_to_dir = 0

let g:startify_bookmarks = [
      \ {'z': '~/.zshrc'},
      \ {'t': '~/.tmux.conf'},
      \ {'v': '~/.config/nvim/init.vim'},
      \ {'c': '~/.config/nvim/coc-settings.json'},
      \ {'p': '~/Documents/Projects' },
      \ ]

let g:startify_commands = [ {'i': 'PlugInstall'} ]
let g:startify_files_number = 4
let g:startify_lists = [
  \ { 'type': 'files',      'header':   ['  Recent'           ] },
  \ { 'type': 'dir',        'header':   ['  Current Directory'] },
  \ { 'type': 'bookmarks',  'header':   ['  Bookmarks'        ] },
  \ { 'type': 'commands',    'header':  ['  Commands'         ] },
  \ ]
