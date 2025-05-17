local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local capabilities = cmp_nvim_lsp.default_capabilities()

-- configure html server
lspconfig["html"].setup({
  capabilities = capabilities,
})
-- configure typescript server with plugin
lspconfig["ts_ls"].setup({
  -- 8 gb
  maxTsServerMemory = 8000,
  capabilities = capabilities,
})

lspconfig["denols"].setup({ on_attach = function(client, bufnr) end })

-- configure css server
lspconfig["cssls"].setup({
  capabilities = capabilities,
})

-- configure tailwindcss server
lspconfig["tailwindcss"].setup({
  capabilities = capabilities,

  filetypes = {},
})
