local success, catppuccin = pcall(require, 'catppuccin')

if not success then
  return
end

catppuccin.setup {
  flavour = 'mocha',
  transparent_background = false,

  integrations = {
    cmp = true,
    gitsigns = true,
    hop = true,
    nvimtree = true,
    mason = true,
    telescope = true,
    treesitter = true,
    ts_rainbow = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { 'italic' },
        hints = { 'italic' },
        warnings = { 'italic' },
        information = { 'italic' },
      },
      underlines = {
        errors = { 'underline' },
        hints = { 'underline' },
        warnings = { 'underline' },
        information = { 'underline' },
      },
    },
  },

  highlight_overrides = {
    mocha = function(mocha)
      return {
        -- Nvim Tree
        NvimTreeRootFolder = { fg = mocha.mantle },
        NvimTreeWinSeparator = { bg = 'none' },
      }
    end,
  },
}

vim.cmd [[ colorscheme catppuccin ]]
