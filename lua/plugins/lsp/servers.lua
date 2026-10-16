local utils = require("utils")
local M = {}

M.pkgs = {
  { "gopls", condition = utils.has_exec("go") },
  { "jdtls", condition = utils.has_exec("java") },
  "angular-language-server",
  "css-lsp",
  "html-lsp",
  "json-lsp",
  "lua-language-server",
  "pyright",
  "vtsls",
}

M.cfg = {
  lua_ls = {
    settings = {
      Lua = {
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
        hint = { enable = false },
        codeLens = { enable = false },
      },
    },
  },

  pyright = {
    settings = {
      pyright = {
        disableOrganizeImports = true,
      },
      python = {
        analysis = {
          typeCheckingMode = "off",
        },
      },
    },
  },
}

return M
