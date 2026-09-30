local colors = require("tokyonight.colors").setup()
local M = {
  "nvim-lualine/lualine.nvim",
}

M.opts = {
  options = {
    theme = "auto",
    component_separators = "",
    section_separators = "",
    disabled_filetypes = {
      "alpha",
      "conform-info",
      "lazy",
      "mason",
      "oil",
      "TelescopePrompt",
    },
  },
  sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

local section = {
  left = function(component)
    table.insert(M.opts.sections.lualine_c, component)
  end,
  right = function(component)
    table.insert(M.opts.sections.lualine_x, component)
  end,
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
}

section.left({
  function()
    return "▊"
  end,
  color = { fg = colors.blue },
  padding = { left = 0, right = 1 },
})

section.left({
  function()
    return ""
  end,
  color = function()
    local mode_color = {
      n = colors.red,
      i = colors.green,
      v = colors.blue,
      [""] = colors.blue,
      V = colors.blue,
      c = colors.magenta,
      no = colors.red,
      s = colors.orange,
      S = colors.orange,
      [""] = colors.orange,
      ic = colors.yellow,
      R = colors.purple,
      Rv = colors.purple,
      cv = colors.red,
      ce = colors.red,
      r = colors.cyan,
      rm = colors.cyan,
      ["r?"] = colors.cyan,
      ["!"] = colors.red,
      t = colors.red,
    }
    return { fg = mode_color[vim.fn.mode()] }
  end,
  padding = { right = 1 },
})

section.left({
  "filesize",
  color = { fg = colors.teal },
  cond = conditions.buffer_not_empty,
})

section.left({
  "filename",
  color = { fg = colors.magenta, gui = "bold" },
  cond = conditions.buffer_not_empty,
})

section.left({
  "location",
  color = { fg = colors.blue1 },
})

section.left({
  "progress",
  color = { fg = colors.blue1, gui = "bold" },
})

section.left({
  "diagnostics",
  sources = { "nvim_diagnostic" },
  symbols = {
    error = " ",
    warn = " ",
    info = " ",
    hint = " ",
  },
  diagnostics_color = {
    error = { fg = colors.red },
  },
})

section.left({
  function()
    return "%="
  end,
})

section.left({
  function()
    local buf_ft = vim.bo.filetype
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.tbl_contains(filetypes, buf_ft) then
        return client.name
      end
    end
    return clients[1] and clients[1].name or ""
  end,
  icon = " ",
  color = { fg = colors.green2, gui = "bold" },
  cond = function()
    return conditions.buffer_not_empty() and #vim.lsp.get_clients({ bufnr = 0 }) > 0
  end,
})

section.right({
  "filetype",
  icons_enabled = true,
  icon_only = true,
  on_click = function()
    vim.notify("filetype: " .. vim.bo.filetype, vim.log.levels.INFO)
  end,
})

section.right({
  "o:encoding",
  fmt = string.upper,
  color = { fg = colors.green, gui = "bold" },
  cond = conditions.hide_in_width,
})

section.right({
  "fileformat",
  fmt = string.upper,
  icons_enabled = false,
  color = { fg = colors.green1, gui = "bold" },
})

section.right({
  "branch",
  icon = "",
  color = { fg = colors.purple, gui = "bold" },
})

section.right({
  "diff",
  symbols = {
    added = " ",
    modified = " ",
    removed = " ",
  },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.orange },
    removed = { fg = colors.red },
  },
  source = function()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
      return {
        added = gitsigns.added,
        modified = gitsigns.changed,
        removed = gitsigns.removed,
      }
    end
  end,
  cond = conditions.hide_in_width,
})

section.right({
  function()
    return "▊"
  end,
  color = { fg = colors.blue },
  padding = { left = 1 },
})

M.config = function(_, opts)
  require("lualine").setup(opts)
end

return M
