local utils = require("utils")
local M = {}

M.pkgs = {
  {
    "gopls",
    auto_update = true,
    condition = utils.has_exec("go"),
  },
  "angular-language-server",
  "css-lsp",
  "html-lsp",
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
