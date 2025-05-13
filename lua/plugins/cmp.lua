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
    local cmp = require("cmp")
    local luasinp = require("luasnip")

    cmp.setup({
      snippet = {
        --   -- Exclusive to LuaSnip, check nvim-cmp documentation for usage with a different snippet engine
        expand = function(args)
          luasinp.lsp_expand(args.body)
        end,
      },
      completion = {
        completeopt = "menu,menuone,noinsert",
      },

      sources = {
        {
          name = "nvim_lsp",
          entry_filter = function(entry)
            return cmp.lsp.CompletionItemKind.Snippet ~= entry:get_kind()
          end,
        },
        { name = "buffer" },
        { name = "path" },
      },

      mapping = {
        ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ["<C-l>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
        ["<CR>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
      },
    })

    cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
      sources = {
        { name = "nvim_lsp" },
        { name = "dap" },
      },
    })
  end,
}
