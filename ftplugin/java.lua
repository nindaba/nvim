-- ftplugin/java.lua: call start_or_attach when a Java file is loaded
require("jdtls").start_or_attach({
  cmd = {
    vim.fn.expand("$HOME/.local/share/nvim/mason/bin/jdtls"),
    ("--jvm-arg=-javaagent:%s"):format(vim.fn.expand("$HOME/.local/share/nvim/mason/packages/jdtls/lombok.jar")),
  },

  root_dir = vim.fs.root(0, { "settings.gradle", ".git", "pom.xml" }),

  capabilities = require("cmp_nvim_lsp").default_capabilities(),
  init_options = {
    bundles = {
      vim.fn.glob("$HOME/.local/share/nvim/mason/packages/java-*/extension/server/*.jar", true),
    },
  },
  on_attach = function()
    require("jdtls").setup_dap({ hotcodereplace = "auto" })
    require("jdtls.dap").setup_dap_main_class_configs()
  end,
})
