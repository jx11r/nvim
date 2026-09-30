local M = {}

M.pkgs = {
  "lua-language-server",
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
}

return M
