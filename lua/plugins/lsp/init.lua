return {
  {
    "mason-org/mason.nvim",
    dependencies = { "WhoIsSethDaniel/mason-tool-installer.nvim" },
    opts = { ui = { border = "rounded" } },
    config = function(_, opts)
      require("mason").setup(opts)
      require("mason-tool-installer").setup({
        ensure_installed = vim
          .iter({
            require("plugins.lsp.servers").pkgs,
            require("plugins.lsp.formatters").pkgs,
            require("plugins.lsp.linters").pkgs,
          })
          :flatten()
          :totable(),
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason-org/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp_keymaps", { clear = true }),
        callback = function(event)
          require("plugins.lsp.keymaps").setup(event.buf)
        end,
      })

      vim.lsp.config("*", {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })

      for server, config in pairs(require("plugins.lsp.servers").cfg) do
        vim.lsp.config(server, config)
      end

      require("mason-lspconfig").setup()

      vim.diagnostic.config({
        severity_sort = true,
        underline = true,
        update_in_insert = false,
        float = { border = "rounded" },
        virtual_text = {
          prefix = "●",
          spacing = 4,
          source = "if_many",
        },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.INFO] = " ",
            [vim.diagnostic.severity.HINT] = " ",
          },
        },
      })
    end,
  },

  require("plugins.lsp.formatters").spec,
  require("plugins.lsp.linters").spec,
}
