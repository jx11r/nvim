local utils = require("utils")
local M = {}

M.pkgs = {
  { "gofumpt", condition = utils.has_exec("go") },
  { "goimports", condition = utils.has_exec("go") },
  "ruff",
  "stylua",
}

M.spec = {
  "stevearc/conform.nvim",
  lazy = true,
  cmd = "ConformInfo",
  opts = {
    formatters_by_ft = {
      go = { "goimports", "gofumpt" },
      lua = { "stylua" },
      python = { "ruff_organize_imports", "ruff_format" },
    },
  },
}

return M
