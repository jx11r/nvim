local utils = require("utils")
local M = {}

M.pkgs = {
  "lua-language-server",
  "pyright",
  {
    "gopls",
    auto_update = true,
    condition = utils.has_exec("go"),
  },
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
