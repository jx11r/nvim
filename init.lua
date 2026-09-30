local fn = vim.fn
local lazypath = fn.stdpath("data") .. "/lazy/lazy.nvim"

require("options")
require("keymaps")
require("autocmds")

-- bootstrap lazy.nvim
if not vim.uv.fs_stat(lazypath) then
  local url = "https://github.com/folke/lazy.nvim.git"
  local out = fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", url, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
  lockfile = fn.stdpath("config") .. "/lock.json",
  install = { colorscheme = { "tokyonight" } },
  ui = { border = "rounded" },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "man",
        "netrwPlugin",
        "rplugin",
        "spellfile",
        "tarPlugin",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
