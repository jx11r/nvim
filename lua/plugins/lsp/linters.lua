local M = {}

M.pkgs = {}

M.spec = {
  "mfussenegger/nvim-lint",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("lint").linters_by_ft = {}
  end,
}

return M
