local M = {}

M.signs = {
  Error = ' ',
  Hint = ' ',
  Info = ' ',
  Warn = ' ',
}

M.border = {
  { '╭', 'FloatBorder' },
  { '─', 'FloatBorder' },
  { '╮', 'FloatBorder' },
  { '│', 'FloatBorder' },
  { '╯', 'FloatBorder' },
  { '─', 'FloatBorder' },
  { '╰', 'FloatBorder' },
  { '│', 'FloatBorder' },
}

function M.setup()
  local open_floating_preview = vim.lsp.util.open_floating_preview

  -- override border on floating windows
  function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or M.border
    return open_floating_preview(contents, syntax, opts, ...)
  end

  vim.diagnostic.config {
    virtual_text = { prefix = '●' },
    severity_sort = true,
    signs = true,
    underline = true,
    update_in_insert = false,
  }

  -- change diagnostic symbols in the sign column
  for type, icon in pairs(M.signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
  end
end

return M
