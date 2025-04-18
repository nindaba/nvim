local conform = require("conform")

conform.formatters_by_ft["java"] = { "google-java-format" }
conform.formatters_by_ft["dart"] = { "dart_format" }
conform.format_on_save = {
  lsp_fallback = true,
}

return {}
