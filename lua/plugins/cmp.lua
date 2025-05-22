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
    "onsails/lspkind.nvim", -- vs-code like pictograms
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
        { name = "render-markdown" },
      },

      mapping = {
        ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ["<C-l>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
        ["<CR>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
      },
      formatting = {
        format = require("lspkind").cmp_format({
          maxwidth = 80,
          mode = "symbol_text",
        }),
      },
    })

    cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
      sources = {
        { name = "nvim_lsp" },
        { name = "dap" },
      },
    })

    local cmdlineMappings = cmp.mapping.preset.cmdline({
      ["<C-k>"] = {
        c = function()
          if cmp.visible() then
            cmp.select_prev_item()
          else
            cmp.complete()
          end
        end,
      },
      ["<C-j>"] = {
        c = function()
          if cmp.visible() then
            cmp.select_next_item()
          else
            cmp.complete()
          end
        end,
      },
      ["<C-l>"] = {
        c = function()
          cmp.confirm()
        end,
      },
      ["<Tab>"] = {
        c = function() end,
      },
      ["kj"] = {
        c = function()
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-c>", true, true, true), "n", true)
        end,
      },
      ["jk"] = {
        c = function()
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-c>", true, true, true), "n", true)
        end,
      },
      [" "] = {
        c = function()
          cmp.confirm()
          vim.api.nvim_feedkeys(" ", "n", true)
        end,
      },
      ["<CR>"] = {
        c = function()
          cmp.confirm()
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<CR>", true, true, true), "n", true)
        end,
      },
    })

    cmp.setup.cmdline("/", {
      mapping = cmdlineMappings,
      sources = {
        { name = "buffer" },
      },
    })

    cmp.setup.cmdline(":", {
      mapping = cmdlineMappings,
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        {
          name = "cmdline",
          option = {
            ignore_cmds = { "Man", "!" },
          },
        },
      }),
    })
    vim.api.nvim_set_hl(0, "CmpItemKindMatch", { fg = "none", bg = "none" })
    vim.api.nvim_set_hl(0, "CmpItemKindMatchFuzzy", { fg = "none", bg = "none" })
    vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = "none", bg = "none" })
    vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = "none", bg = "none" })
    vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "none", bg = "none" })
    vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { fg = "none", bg = "none" })
    vim.api.nvim_set_hl(0, "CmpItemKindField", { fg = "none", bg = "none" })
    vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "none", bg = "none" })
    vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = "none", bg = "none" })
    vim.api.nvim_set_hl(0, "CmpItemKindInterface", { fg = "none", bg = "none" })
    vim.api.nvim_set_hl(0, "CmpItemKindModule", { fg = "none", bg = "none" })
    vim.api.nvim_set_hl(0, "CmpItemKindProperty", { fg = "none", bg = "none" })
    vim.api.nvim_set_hl(0, "CmpItemKindUnit", { fg = "none", bg = "none" })
    vim.api.nvim_set_hl(0, "CmpItemKindValue", { fg = "none", bg = "none" })
    vim.api.nvim_set_hl(0, "CmpItemKindEnum", { fg = "none", bg = "none" })
    vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "none", bg = "none" })
    vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "none", bg = "none" })
    vim.api.nvim_set_hl(0, "CmpItemKindColor", { fg = "none", bg = "none" })
    vim.api.nvim_set_hl(0, "CmpItemKindFile", { fg = "none", bg = "none" })
    vim.api.nvim_set_hl(0, "CmpItemKindReference", { fg = "none", bg = "none" })
    vim.api.nvim_set_hl(0, "CmpItemKindFolder", { fg = "none", bg = "none" })
    vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { fg = "none", bg = "none" })
    vim.api.nvim_set_hl(0, "CmpItemKindConstant", { fg = "none", bg = "none" })
    vim.api.nvim_set_hl(0, "CmpItemKindStruct", { fg = "none", bg = "none" })
    vim.api.nvim_set_hl(0, "CmpItemKindEvent", { fg = "none", bg = "none" })
    vim.api.nvim_set_hl(0, "CmpItemKindOperator", { fg = "none", bg = "none" })
    vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { fg = "none", bg = "none" })
  end,
}
