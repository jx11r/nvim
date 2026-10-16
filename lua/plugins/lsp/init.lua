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
      local group = vim.api.nvim_create_augroup("lsp_attach", { clear = true })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = group,
        callback = function(event)
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          local bufnr = event.buf

          if not client then
            return
          end

          if client:supports_method("textDocument/inlayHint", bufnr) then
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
          end

          if client:supports_method("textDocument/codeLens", bufnr) then
            vim.lsp.codelens.enable(true, { bufnr = bufnr })
          end

          require("plugins.lsp.keymaps").setup(bufnr)
        end,
      })

      vim.lsp.config("*", {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })

      for server, config in pairs(require("plugins.lsp.servers").cfg) do
        vim.lsp.config(server, config)
      end

      require("mason-lspconfig").setup({
        automatic_enable = {
          exclude = { "jdtls" },
        },
      })

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

  {
    "Wansmer/symbol-usage.nvim",
    event = "LspAttach",
    opts = {
      vt_position = "end_of_line",
      request_pending_text = false,
    },
  },

  require("plugins.lsp.formatters").spec,
  require("plugins.lsp.linters").spec,
}
