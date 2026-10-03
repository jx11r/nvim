local utils = require("utils")
local M = {}

M.pkgs = {
  { "golangci-lint", condition = utils.has_exec("go") },
  "eslint_d",
  "mypy",
}

local cfg = {
  mypy = function(linter)
    local venv = os.getenv("VIRTUAL_ENV")
    if venv then
      local path = venv .. "/bin/python"
      linter.args = vim.list_extend({ "--python-executable", path }, linter.args or {})
    end
  end,
}

M.spec = {
  "mfussenegger/nvim-lint",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      go = { "golangcilint" },
      python = { "mypy" },
      typescript = { "eslint_d" },
    }

    for name, setup in pairs(cfg) do
      if lint.linters[name] then
        setup(lint.linters[name])
      end
    end

    vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
      group = vim.api.nvim_create_augroup("linter", { clear = true }),
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}

return M
