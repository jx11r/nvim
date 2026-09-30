local M = {
  "goolord/alpha-nvim",
  event = "VimEnter",
}

local ascii = {
  [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣤⣴⣶⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠀⠀⢶⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
  [[ ⠀⠀⠀⠀⠀⠀⣠⣴⣾⣿⣿⣿⡿⢻⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⡿⣿⣿⣶⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
  [[ ⠀⠀⢀⣤⣶⠿⠋⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠻⣿⣿⣷⣶⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
  [[ ⠀⣠⡿⠟⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠻⣿⣿⣦⣄⠀⠀⠀⠀⠀⠀ ]],
  [[ ⠀⠟⠀⠀⠀⢀⠀⣠⣀⣀⣀⣀⣀⠀⢀⣠⣇⣤⡄⢀⣤⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣿⣿⣧⣄⠀⠀⠀⠀ ]],
  [[ ⠀⠀⠀⢀⣴⣾⣿⣿⣿⣿⣯⣭⣙⣻⢿⣿⣿⣿⣿⣿⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣀⣀⣀⠀⠀⠀⠀⠀⠀⠉⠛⠛⠿⣦⠀⠀⠀ ]],
  [[ ⠀⠀⢠⣿⣿⣿⢿⣿⣿⣿⣿⡇⠈⠙⢿⣿⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⢠⣦⣷⡾⢻⣿⣿⣿⣿⣿⣛⣲⣦⣄⡀⠀⠀⠀⠀⠀⠹⢷⣃⠀ ]],
  [[ ⠀⢰⣿⣿⣿⣿⣬⣿⣿⣿⣿⣁⣠⡄⠀⠙⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⣶⣿⠟⢩⣿⣿⣿⣿⣿⡿⣿⣿⣷⣦⡀⠀⠀⠀⠀⠻⡅ ]],
  [[ ⣴⣿⡿⠻⠿⢿⡿⣿⡿⠿⠟⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠻⣿⣷⣦⣬⣿⣿⣷⣿⠟⠀⠈⢹⣿⣿⣿⣧⠀⠀⠀⠀⠀ ]],
  [[ ⠘⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠻⢿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠞⠦⠀⠀ ]],
  [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠛⠉⠋⠛⠛⠻⠿⢿⣿⣿⣿⣶⣦⡄⠀ ]],
  [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠙⠛⣷⣇⠀ ]],
  [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⠀ ]],
  [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠁ ]],
  [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀ ]],
  [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⡀ ]],
  [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡏⠀ ]],
}

M.opts = function()
  local button = require("alpha.themes.dashboard").button
  return {
    header = {
      type = "text",
      val = ascii,
      opts = {
        position = "center",
        hl = "AlphaHeader",
      },
    },

    buttons = {
      type = "group",
      val = {
        button("e", "󱪝  New file", "<cmd>ene <bar> startinsert<cr>"),
        button("f", "  Find file", "<cmd>Telescope find_files<cr>"),
        button("r", "󰈢  Recent files", "<cmd>Telescope oldfiles<cr>"),
        button("g", "󰦨  Find word", "<cmd>Telescope live_grep<cr>"),
        button("c", "  Configuration", "<cmd>e $MYVIMRC | cd %:p:h<cr>"),
        button("s", "󰁯  Open last session", [[<cmd>lua require("persistence").load() <cr>]]),
      },
      opts = { spacing = 1 },
    },

    footer = {
      type = "text",
      val = "",
      opts = {
        position = "center",
        hl = "AlphaFooter",
      },
    },
  }
end

M.config = function(_, opts)
  if vim.o.filetype == "lazy" then
    vim.cmd.close()
    vim.api.nvim_create_autocmd("User", {
      once = true,
      pattern = "AlphaReady",
      callback = function()
        require("lazy").show()
      end,
    })
  end

  for _, button in ipairs(opts.buttons.val) do
    button.opts.hl = "AlphaButton"
    button.opts.hl_shortcut = "AlphaShortcut"
  end

  require("alpha").setup({
    layout = {
      { type = "padding", val = 8 },
      opts.header,
      { type = "padding", val = 4 },
      opts.buttons,
      { type = "padding", val = 1 },
      opts.footer,
    },
    opts = { margin = 5 },
  })

  vim.api.nvim_create_autocmd("User", {
    once = true,
    pattern = "LazyVimStarted",
    callback = function()
      local stats = require("lazy").stats()
      opts.footer.val = string.format("neovim loaded %d plugins in %.2fms", stats.count, stats.startuptime)
      pcall(vim.cmd.AlphaRedraw)
    end,
  })
end

return M
