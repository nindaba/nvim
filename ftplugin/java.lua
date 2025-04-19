-- ftplugin/java.lua: call start_or_attach when a Java file is loaded
require("jdtls").start_or_attach({
  cmd = {
    vim.fn.expand("$HOME/.local/share/nvim/mason/bin/jdtls"),
    "-Dosgi.bundles.defaultStartLevel=4 ",
    ("--jvm-arg=-javaagent:%s"):format(vim.fn.expand("$HOME/.local/share/nvim/mason/packages/jdtls/lombok.jar")),
  },

  root_dir = vim.fs.root(0, { "settings.gradle", ".git", "pom.xml" }),

  capabilities = require("cmp_nvim_lsp").default_capabilities(),
  init_options = {
    bundles = {
      -- "/Users/nindaba/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-0.53.1.jar",
      "/Users/nindaba/.local/share/nvim/mason/packages/java-test/extension/server/com.microsoft.java.test.plugin-0.43.0.jar",
      "/Users/nindaba/.local/share/nvim/mason/packages/java-test/extension/server/com.microsoft.java.test.runner-jar-with-dependencies.jar",
      "/Users/nindaba/.local/share/nvim/mason/packages/java-test/extension/server/jacocoagent.jar",
      "/Users/nindaba/.local/share/nvim/mason/packages/java-test/extension/server/junit-jupiter-api_5.11.0.jar",
      "/Users/nindaba/.local/share/nvim/mason/packages/java-test/extension/server/junit-jupiter-engine_5.11.0.jar",
      "/Users/nindaba/.local/share/nvim/mason/packages/java-test/extension/server/junit-jupiter-migrationsupport_5.11.0.jar",
      "/Users/nindaba/.local/share/nvim/mason/packages/java-test/extension/server/junit-jupiter-params_5.11.0.jar",
      "/Users/nindaba/.local/share/nvim/mason/packages/java-test/extension/server/junit-platform-commons_1.11.0.jar",
      "/Users/nindaba/.local/share/nvim/mason/packages/java-test/extension/server/junit-platform-engine_1.11.0.jar",
      "/Users/nindaba/.local/share/nvim/mason/packages/java-test/extension/server/junit-platform-launcher_1.11.0.jar",
      "/Users/nindaba/.local/share/nvim/mason/packages/java-test/extension/server/junit-platform-runner_1.11.0.jar",
      "/Users/nindaba/.local/share/nvim/mason/packages/java-test/extension/server/junit-platform-suite-api_1.11.0.jar",
      "/Users/nindaba/.local/share/nvim/mason/packages/java-test/extension/server/junit-platform-suite-commons_1.11.0.jar",
      "/Users/nindaba/.local/share/nvim/mason/packages/java-test/extension/server/junit-platform-suite-engine_1.11.0.jar",
      "/Users/nindaba/.local/share/nvim/mason/packages/java-test/extension/server/junit-vintage-engine_5.11.0.jar",
      "/Users/nindaba/.local/share/nvim/mason/packages/java-test/extension/server/org.apiguardian.api_1.1.2.jar",
      "/Users/nindaba/.local/share/nvim/mason/packages/java-test/extension/server/org.eclipse.jdt.junit4.runtime_1.3.100.v20231214-1952.jar",
      "/Users/nindaba/.local/share/nvim/mason/packages/java-test/extension/server/org.eclipse.jdt.junit5.runtime_1.1.300.v20231214-1952.jar",
      "/Users/nindaba/.local/share/nvim/mason/packages/java-test/extension/server/org.jacoco.core_0.8.12.202403310830.jar",
      "/Users/nindaba/.local/share/nvim/mason/packages/java-test/extension/server/org.opentest4j_1.3.0.j",
    },
  },
  on_attach = function()
    require("jdtls").setup_dap({ hotcodereplace = "auto" })
    require("jdtls.dap").setup_dap_main_class_configs()
  end,
})
