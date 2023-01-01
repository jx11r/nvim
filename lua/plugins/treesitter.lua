local M = {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  event = 'BufReadPost',
  dependencies = {
    'p00f/nvim-ts-rainbow',
  },
}

function M.config()
  require('nvim-treesitter.configs').setup {
    auto_install = true,
    highlight = { enable = true },
    sync_install = false,

    ensure_installed = {
      'bash',
      'c',
      'cmake',
      'cpp',
      'css',
      'diff',
      'gitignore',
      'go',
      'haskell',
      'html',
      'java',
      'javascript',
      'json',
      'lua',
      'make',
      'markdown',
      'php',
      'python',
      'regex',
      'rust',
      'scss',
      'sql',
      'tsx',
      'toml',
      'vim',
      'yaml',
    },

    rainbow = {
      enable = true,
      extended_mode = true,
    },
  }
end

return M
