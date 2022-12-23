local success, catppuccin = pcall(require, 'catppuccin')

if not success then
  return
end

catppuccin.setup {
  flavour = 'mocha',
  transparent_background = true,

  integrations = {
    nvimtree = true,
    telescope = true,
  },
}

vim.cmd [[ colorscheme catppuccin ]]
