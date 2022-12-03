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
    'c',
    'lua',
  },
}
