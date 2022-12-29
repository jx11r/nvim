require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
    disable = {},
  },

  rainbow = {
    enable = true,
    extended_mode = true,
  },

  ensure_installed = {
    'bash',
    'c',
    'cmake',
    'cpp',
    'css',
    'diff',
    -- 'gitignore',
    'go',
    'html',
    'java',
    'javascript',
    'json',
    'lua',
    'make',
    'markdown',
    'python',
    'rust',
    'toml',
    'yaml',
  },
}
