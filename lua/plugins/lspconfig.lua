return {
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  dependencies = {
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "WhoIsSethDaniel/mason-tool-installer.nvim" },
    { "mfussenegger/nvim-jdtls" },
    --TODO: nvim-notify replace
    { "j-hui/fidget.nvim", opts = {} },
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      automatic_enable = {
        "lua_ls",
        "graphql",
        "html",
        "ts_ls",
        "cssls",
        "tailwindcss",
      },
      ensure_installed = {
        "bashls",
        "cssls",
        "html",
        "gradle_ls",
        "groovyls",
        "lua_ls",
        "jdtls",
        "jsonls",
        "lemminx",
        "marksman",
        "yamlls",
        "ts_ls",
        "tailwindcss",
        "graphql",
      },
    })
    require("mason-tool-installer").setup({
      ensure_installed = {
        "java-debug-adapter",
        "java-test",
        "google-java-format",
        "eslint_d",
        "prettier",
        "prettierd",
      },
    })

    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local capabilities = cmp_nvim_lsp.default_capabilities()

    lspconfig.graphql.setup({
      capabilities = capabilities,
    })
    -- configure html server
    lspconfig["html"].setup({
      capabilities = capabilities,
    })
    -- configure typescript server with plugin
    lspconfig["ts_ls"].setup({
      -- 8 gb
      maxTsServerMemory = 8000,
      capabilities = capabilities,
      filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
      },
    })

    lspconfig["denols"].setup({ on_attach = function(client, bufnr) end })

    -- configure css server
    lspconfig["cssls"].setup({
      capabilities = capabilities,
    })

    -- configure tailwindcss server
    lspconfig["tailwindcss"].setup({
      capabilities = capabilities,

      filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
        "html",
        "css",
        "scss",
        "less",
      },
    })

    vim.api.nvim_command("MasonToolsInstall")
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    local open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = opts.border or "rounded" -- Set border to rounded
      return open_floating_preview(contents, syntax, opts, ...)
    end
  end,
}
