local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local capabilities = cmp_nvim_lsp.default_capabilities()

-- configure graphql language server
lspconfig["graphql"].setup({
  capabilities = capabilities,
})
