local M = {}

M.disabled_filetypes = {
  'python',
}

function M.format(bufnr, ft)
  local get_available = require('null-ls.sources').get_available
  vim.lsp.buf.format {
    filter = function(client)
      if #get_available(ft, 'NULL_LS_FORMATTING') > 0 then
        return client.name == 'null-ls'
      end
      return client.name ~= 'null-ls'
    end,
    bufnr = bufnr,
  }
end

function M.setup(client, bufnr)
  local ft = vim.bo[bufnr].filetype
  if vim.tbl_contains(M.disabled_filetypes, ft) then
    return
  end

  if client.supports_method 'textDocument/formatting' then
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = vim.api.nvim_create_augroup('LspFormatting', {}),
      buffer = bufnr,
      callback = function(e)
        M.format(e.buf, vim.bo[e.buf].filetype)
      end,
    })
  end
end

return M
