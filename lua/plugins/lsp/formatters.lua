local M = {}

M.pkgs = {
  "ruff",
  "stylua",
}

M.spec = {
  "stevearc/conform.nvim",
  lazy = true,
  cmd = "ConformInfo",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "ruff_organize_imports", "ruff_format" },
    },
  },
}

return M
