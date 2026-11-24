local M = {
  "rebelot/kanagawa.nvim",
  priority = 1000,
}

M.opts = {}

M.opts.overrides = function(colors)
  local palette = colors.palette
  local theme = colors.theme
  return {
    NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
    NormalFloat = { bg = "none" },
    FloatBorder = { bg = "none" },
    FloatTitle = { bg = "none" },

    AlphaHeader = { fg = palette.springViolet1 },
    AlphaButton = { fg = palette.waveAqua1 },
    AlphaShortcut = { fg = palette.surimiOrange },
    AlphaFooter = { fg = palette.fujiGray, italic = true },
  }
end

M.config = function(_, opts)
  require("kanagawa").setup(opts)
  vim.cmd("colorscheme kanagawa-dragon")
end

return M
