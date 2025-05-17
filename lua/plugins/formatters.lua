local conform = require("conform")

conform.formatters_by_ft["java"] = { "google-java-format" }
conform.formatters_by_ft["dart"] = { "dart_format" }
conform.formatters_by_ft["graphqls"] = { "prettierd", "prettier" }
conform.formatters_by_ft["graphql"] = { "prettierd", "prettier" }
conform.formatters_by_ft["typescript"] = { "prettierd", "prettier" }
conform.formatters_by_ft["html"] = { "prettierd", "prettier" }
conform.formatters_by_ft["typescriptreact"] = { "prettierd", "prettier" }
conform.formatters_by_ft["javascript"] = { "prettierd", "prettier" }
conform.formatters_by_ft["javascriptreact"] = { "prettierd", "prettier" }

conform.format_on_save = {
  lsp_fallback = true,
}

return {}
