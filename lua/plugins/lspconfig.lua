return {
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  dependencies = {
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "WhoIsSethDaniel/mason-tool-installer.nvim" },
    { "mfussenegger/nvim-jdtls" },
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
        "jdtls",
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

    lspconfig["jdtls"].setup({
      root_dir = vim.fs.root(0, { "settings.gradle", ".git", "pom.xml" }),

      init_options = {
        bundles = bundles,
      },

      capabilities = require("cmp_nvim_lsp").default_capabilities(),

      settings = {
        java = {
          format = {
            insertSpaces = true,
            tabSize = 2,
            shiftwidth = 2,
          },
        },
      },

      on_attach = function()
        local map = vim.keymap

        require("jdtls").setup_dap({ hotcodereplace = "auto" })
        require("jdtls.dap").setup_dap_main_class_configs()

        map.set("n", "<leader>tt", function()
          vim.cmd(":wa")
          require("jdtls").test_nearest_method()
        end, { desc = "Test method" })

        require("jdtls").setup_dap({ hotcodereplace = "auto" })
        require("jdtls.dap").setup_dap_main_class_configs()

        map.set("n", "<leader>tt", function()
          vim.cmd(":wa")
          require("jdtls").test_nearest_method()
        end, { desc = "Test method" })

        map.set("n", "<leader>ta", function()
          vim.cmd(":wa")
          require("jdtls").test_class()
        end, { desc = "Test all" })

        map.set("n", "<leader>tt", function()
          vim.cmd(":wa")
          require("jdtls").test_nearest_method()
        end, { desc = "Test method" })

        map.set("n", "<leader>ta", function()
          vim.cmd(":wa")
          require("jdtls").test_class()
        end, { desc = "Test all" })

        vim.opt.shiftwidth = 2
      end,
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
