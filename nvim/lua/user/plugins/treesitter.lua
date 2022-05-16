require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'c', 'cpp', 'cmake', 'glsl',
    'rust', 'toml',
    'python',
    'java',
    'c_sharp',
    'lua',
    'json', 'yaml',
    'javascript', 'css', 'scss', 'html', 'svelte', 'tsx', 'typescript', 'vue',
    'comment',
    'bash',
  },
  highlight = {
    enable = true,
    -- disable = { 'NvimTree' },
    additional_vim_regex_highlighting = false,
  },
}
