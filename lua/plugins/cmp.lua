local M = {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
    "lukas-reineke/cmp-under-comparator",
    "onsails/lspkind.nvim",
  },
}

M.opts = function()
  local cmp = require("cmp")
  local luasnip = require("luasnip")
  local lspkind = require("lspkind")
  return {
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },

    formatting = {
      format = lspkind.cmp_format(),
    },

    window = {
      completion = cmp.config.window.bordered({ border = "rounded" }),
      documentation = cmp.config.window.bordered({ border = "rounded" }),
    },

    mapping = cmp.mapping.preset.insert({
      ["<C-e>"] = cmp.mapping.abort(),
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-space>"] = cmp.mapping.complete(),
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.confirm({ select = true })
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
    }),

    sorting = {
      comparators = {
        cmp.config.compare.offset,
        cmp.config.compare.exact,
        cmp.config.compare.score,
        require("cmp-under-comparator").under,
        cmp.config.compare.recently_used,
        cmp.config.compare.locality,
        cmp.config.compare.kind,
        cmp.config.compare.sort_text,
        cmp.config.compare.length,
        cmp.config.compare.order,
      },
    },

    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "nvim_lua" },
      { name = "buffer" },
      { name = "path" },
      { name = "luasnip" },
    }),
  }
end

return M
