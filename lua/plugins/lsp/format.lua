local M = {}

function M.disabled(ft)
  local filetypes = {
    'python',
  }

  for _, filetype in pairs(filetypes) do
    if filetype == ft then
      return true
    end
  end
end

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
  local ft = vim.api.nvim_buf_get_option(bufnr, 'filetype')
  if client.supports_method 'textDocument/formatting' and not M.disabled(ft) then
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = vim.api.nvim_create_augroup('LspFormat', {}),
      buffer = bufnr,
      callback = function()
        M.format(bufnr, ft)
      end,
    })
  end
end

return M
