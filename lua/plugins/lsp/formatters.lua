local utils = require("utils")
local M = {}

M.pkgs = {
  { "gofumpt", condition = utils.has_exec("go") },
  { "goimports", condition = utils.has_exec("go") },
  { "palantir-java-format", condition = utils.has_exec("java") },
  "prettier",
  "ruff",
  "stylua",
}

local cfg = {}

M.spec = {
  "stevearc/conform.nvim",
  lazy = true,
  cmd = "ConformInfo",
  opts = {
    formatters_by_ft = {
      css = { "prettier" },
      go = { "goimports", "gofumpt" },
      html = { "prettier" },
      java = { "palantir-java-format" },
      javascript = { "prettier" },
      json = { "prettier" },
      lua = { "stylua" },
      python = { "ruff_organize_imports", "ruff_format" },
      scss = { "prettier" },
      typescript = { "prettier" },
    },

    formatters = cfg,
  },
}

return M
