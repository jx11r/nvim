local colors = require("kanagawa.colors").setup({theme = "dragon"}).palette

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
  color = { fg = colors.dragonBlue },
  padding = { left = 0, right = 1 },
})

section.left({
  function()
    return ""
  end,
  color = function()
    local mode_color = {
      n = colors.waveRed,
      i = colors.springGreen,
      v = colors.springBlue,
      [""] = colors.springBlue,
      V = colors.springBlue,
      c = colors.sakuraPink,
      no = colors.waveRed,
      s = colors.surimiOrange,
      S = colors.surimiOrange,
      [""] = colors.surimiOrange,
      ic = colors.carpYellow,
      R = colors.oniViolet,
      Rv = colors.oniViolet,
      cv = colors.waveRed,
      ce = colors.waveRed,
      r = colors.lightBlue,
      rm = colors.lightBlue,
      ["r?"] = colors.lightBlue,
      ["!"] = colors.waveRed,
      t = colors.waveRed,
    }
    return { fg = mode_color[vim.fn.mode()] }
  end,
  padding = { right = 1 },
})

section.left({
  "filesize",
  color = { fg = colors.waveAqua2 },
  cond = conditions.buffer_not_empty,
})

section.left({
  "filename",
  color = { fg = colors.oniViolet, gui = "bold" },
  cond = conditions.buffer_not_empty,
})

section.left({
  "location",
  color = { fg = colors.springViolet2 },
})

section.left({
  "progress",
  color = { fg = colors.springViolet2, gui = "bold" },
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
  color = { fg = colors.springViolet1, gui = "bold" },
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
  color = { fg = colors.springGreen, gui = "bold" },
  cond = conditions.hide_in_width,
})

section.right({
  "fileformat",
  fmt = string.upper,
  icons_enabled = false,
  color = { fg = colors.waveAqua1, gui = "bold" },
})

section.right({
  "branch",
  icon = "",
  color = { fg = colors.sakuraPink, gui = "bold" },
})

section.right({
  "diff",
  symbols = {
    added = " ",
    modified = " ",
    removed = " ",
  },
  diff_color = {
    added = { fg = colors.autumnGreen },
    modified = { fg = colors.autumnYellow },
    removed = { fg = colors.autumnRed },
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
  color = { fg = colors.dragonBlue },
  padding = { left = 1 },
})

M.config = function(_, opts)
  require("lualine").setup(opts)
end

return M
