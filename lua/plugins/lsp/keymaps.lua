local M = {}

M.setup = function(bufnr)
  local function map(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
  end
  -- diagnostics
  map("n", "q", vim.diagnostic.open_float, "Show line diagnostic")

  -- lsp
  map("n", "gd", vim.lsp.buf.definition, "Goto definition")
  map("n", "gD", vim.lsp.buf.declaration, "Goto declaration")
  map("n", "gi", vim.lsp.buf.implementation, "Goto implementation")
  map("n", "K", vim.lsp.buf.hover, "Hover documentation")
  map("i", "<C-k>", vim.lsp.buf.signature_help, "Signature help")

  -- actions
  map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
  map({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")
  map({ "n", "x" }, "<C-f>", function()
    require("conform").format({
      async = true,
      lsp_format = "fallback",
    })
  end, "Format document")
end

return M
