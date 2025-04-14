-- Plugin manager: install nvim-cmp, LuaSnip, cmp_luasnip, and cmp-nvim-lsp
return {
  "hrsh7th/nvim-cmp",
  enabled = true,
  version = false, -- Ignore tags because nvim-cmp has a very old tag
  event = "InsertEnter",

  dependencies = {
    "L3MON4D3/LuaSnip", -- Snippet engine
    "saadparwaiz1/cmp_luasnip", -- Snippet engine adapter
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
  },
  config = function()
    require("cmp").setup({
      snippet = {
        -- Exclusive to LuaSnip, check nvim-cmp documentation for usage with a different snippet engine
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = {
        -- Sample but necessary mappings, read nvim-cmp documentation to customize them
        ["jk"] = require("cmp").mapping.abort(),
        ["kj"] = require("cmp").mapping.abort(),
        ["<CR>"] = require("cmp").mapping.confirm(),
        ["<Tab>"] = require("cmp").mapping.select_next_item(),
        ["<S-Tab>"] = require("cmp").mapping.select_prev_item(),
      },
      sources = {
        { name = "nvim_lsp" },
      },
    })
  end,
}
