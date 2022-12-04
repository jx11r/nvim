local success, catppuccin = pcall(require, 'catppuccin')

if not success then
  return
end

catppuccin.setup {
  flavour = 'mocha',

  integrations = {
    nvimtree = true,
  },
}

vim.cmd [[ colorscheme catppuccin ]]
