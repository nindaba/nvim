local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local capabilities = cmp_nvim_lsp.default_capabilities()

-- configure json-lsp server
lspconfig["jsonls"].setup({
  capabilities = capabilities,
})
