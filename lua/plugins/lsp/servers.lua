local M = {}

M.pkgs = {
  "lua-language-server",
  "pyright",
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
