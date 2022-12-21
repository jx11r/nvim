local success, treesitter = pcall(require, 'nvim-treesitter.configs')

if not success then
  return
end

treesitter.setup {
  highlight = {
    enable = true,
    disable = {},
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
