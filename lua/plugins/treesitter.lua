local M = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
}

-- https://github.com/nvim-treesitter/nvim-treesitter/blob/main/SUPPORTED_LANGUAGES.md
M.config = function()
  require("nvim-treesitter").install({
    "bash",
    "c",
    "diff",
    "editorconfig",
    "git_config",
    "gitignore",
    "html",
    "json",
    "lua",
    "luadoc",
    "markdown",
    "markdown_inline",
    "python",
    "regex",
    "ron",
    "toml",
    "vim",
    "vimdoc",
    "xml",
    "yaml",
  })

  vim.api.nvim_create_autocmd("FileType", {
    callback = function()
      pcall(vim.treesitter.start)
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
  })
end

return M
