local M = {}

M.has_exec = function(cmd)
  return function()
    return vim.fn.executable(cmd) == 1
  end
end

return M
