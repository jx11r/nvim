local success, catppuccin = pcall(require, 'catppuccin')

if not success then
  return
end

catppuccin.setup {
  flavour = 'mocha',
  transparent_background = true,

  integrations = {
    cmp = true,
    gitsigns = true,
    hop = true,
    nvimtree = true,
    telescope = true,
    treesitter = true,
  },
}

vim.cmd [[ colorscheme catppuccin ]]
