local utils = require("utils")
local M = {}

M.pkgs = {
  { "gofumpt", condition = utils.has_exec("go") },
  { "goimports", condition = utils.has_exec("go") },
  "prettier",
  "ruff",
  "stylua",
}

M.spec = {
  "stevearc/conform.nvim",
  lazy = true,
  cmd = "ConformInfo",
  opts = {
    formatters_by_ft = {
      css = { "prettier" },
      go = { "goimports", "gofumpt" },
      html = { "prettier" },
      javascript = { "prettier" },
      lua = { "stylua" },
      python = { "ruff_organize_imports", "ruff_format" },
      scss = { "prettier" },
      typescript = { "prettier" },
    },
  },
}

return M
