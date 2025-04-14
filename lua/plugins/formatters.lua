local conform = require("conform")

conform.formatters_by_ft = {
  java = { "google-java-format" },
}

conform.format_on_save = {
  lsp_fallback = true,
}

return {
  -- "stevearc/conform.nvim",
}
