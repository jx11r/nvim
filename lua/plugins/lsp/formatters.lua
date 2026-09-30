local M = {}

M.pkgs = {
  "stylua",
}

M.spec = {
  "stevearc/conform.nvim",
  lazy = true,
  cmd = "ConformInfo",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
    },
  },
}

return M
